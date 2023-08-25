import 'dart:async';
import 'dart:ui' as ui;

import 'package:animations/animations.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:skipee/app/providers/account_provider.dart';
import 'package:skipee/utils/constants/app_assets.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../../../services/error/failure.dart';
import '../../../../../utils/constants/enums/page_state_enum.dart';
import '../../../../../utils/router/app_state.dart';
import '../../../../../utils/router/models/page_action.dart';
import '../../../../../utils/router/models/page_config.dart';
import '../../../../app/globals.dart';

class HomeViewModel extends ChangeNotifier {
  // Value Notifiers
  ValueChanged<String>? onErrorMessage;
  ValueNotifier<bool> isLoadingNotifier = ValueNotifier(false);

  ValueNotifier<bool> showPreferencesNotifier = ValueNotifier<bool>(false);
  ValueNotifier<bool> showControlButtonNotifier = ValueNotifier<bool>(false);
  ValueNotifier<bool> threeDMapTypeNotifier = ValueNotifier<bool>(false);
  ValueNotifier<bool> trafficMapTypeNotifier = ValueNotifier<bool>(false);
  ValueNotifier<MapType> mapDetailsType = ValueNotifier<MapType>(MapType.normal);
  ValueNotifier<double> panelHeightNotifier = ValueNotifier<double>(275.h);

  // App States
  AppState appState = GetIt.I.get<AppState>();

  // Fields
  SharedAxisTransitionType? sharedAxisTransition = SharedAxisTransitionType.horizontal;

  PanelController panelController = PanelController();

  late ScrollController panelScrollController;

  Completer<GoogleMapController> mapController = Completer();

  StreamSubscription<Position>? currentLocationStreamSubscription;

  CameraPosition initialCameraPosition = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Set<Marker> markers = <Marker>{};

  Position? initialPosition;

  // Getters
  AccountProvider get accountProvider => sl();

  // Usecase Calls

  // Methods
  void onMapCreated(GoogleMapController controller) async {
    String mapStyle = await loadMapStyles();
    controller.setMapStyle(mapStyle);
    mapController.complete(controller);
  }

  Future<String> loadMapStyles() async {
    return rootBundle.loadString('assets/style/map_style.json');
  }

  Future<void> getCameraPosition(BuildContext context) async {
    isLoadingNotifier.value = true;
    initialPosition = await getGeoLocationPosition();
    initialCameraPosition = CameraPosition(target: LatLng(initialPosition!.latitude, initialPosition!.longitude), zoom: 18);
    final bitmapImage = await bitmapDescriptorFromSvgAsset(context: context, assetName: AppAssets.currentLocSvg, key: 'CURRENT_LOCATION');
    markers.add(
      Marker(
        markerId: const MarkerId('CURRENT_LOCATION'),
        infoWindow: const InfoWindow(title: 'Current Location'),
        position: LatLng(initialPosition!.latitude, initialPosition!.longitude),
        icon: bitmapImage ?? BitmapDescriptor.defaultMarker,
      ),
    );
    isLoadingNotifier.value = false;
  }

  Future<BitmapDescriptor?> bitmapDescriptorFromSvgAsset({required BuildContext context, required String assetName, required key}) async {
    String svgString = await DefaultAssetBundle.of(context).loadString(assetName);

    DrawableRoot svgDrawableRoot = await svg.fromSvgString(svgString, key);

    MediaQueryData queryData = MediaQuery.of(context);
    double devicePixelRatio = queryData.devicePixelRatio;
    double width = 64 * devicePixelRatio;
    double height = 64 * devicePixelRatio;

    ui.Picture picture = svgDrawableRoot.toPicture(size: Size(width, height));

    ui.Image image = await picture.toImage(width.toInt(), height.toInt());
    ByteData? bytes = await image.toByteData(format: ui.ImageByteFormat.png);
    if (bytes != null) {
      return BitmapDescriptor.fromBytes(bytes.buffer.asUint8List());
    }
    return null;
  }

  Future<void> moveToCurrentLocation() async {
    final controller = await mapController.future;
    final moveToCurrentLocation = CameraPosition(target: LatLng(initialPosition!.latitude, initialPosition!.longitude), zoom: 20, tilt: 20, bearing: 90);
    controller.animateCamera(CameraUpdate.newCameraPosition(moveToCurrentLocation));
  }

  Future<Position> getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      onErrorMessage?.call('Location services are disabled.');
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        onErrorMessage?.call('Location permissions are denied');
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      onErrorMessage?.call('Location permissions are permanently denied, we cannot request permissions.');
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  void onPreferenceButtonClick() {
    print('[onPreferenceButtonClick]: ${showPreferencesNotifier.value}');
    showPreferencesNotifier.value = !showPreferencesNotifier.value;
    if (showPreferencesNotifier.value) {
      panelHeightNotifier.value = 500.h;
      panelController.animatePanelToPosition(1, duration: const Duration(milliseconds: 200));
    } else {
      panelHeightNotifier.value = 275.h;
      panelController.animatePanelToPosition(0, duration: const Duration(milliseconds: 200));
    }
  }

  void onPanelSlide(double pos) {
    showControlButtonNotifier.value = pos > 0.091;
  }

  // Error Handling
  void handleError(Either<Failure, dynamic> either) {
    isLoadingNotifier.value = false;
    either.fold((l) => onErrorMessage?.call(l.message), (r) => null);
  }

  // Moving Pages
  void moveToSignIn() {
    appState.currentAction = PageAction(state: PageState.replaceAll, page: PageConfigs.signInPageConfig);
  }
}
