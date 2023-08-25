import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:skipee/features/home/presentation/manager/home_view_model.dart';
import 'package:skipee/features/home/presentation/widgets/buttons/map_layers_button.dart';
import 'package:skipee/features/home/presentation/widgets/buttons/my_location_button.dart';
import 'package:skipee/features/home/presentation/widgets/buttons/preferences_button.dart';
import 'package:skipee/features/home/presentation/widgets/buttons/profile_back_button.dart';
import 'package:skipee/features/panels/main_panel/presentation/pages/main_panel.dart';
import 'package:skipee/utils/extension/extensions.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../../global_widgets/widgets/skipee_icon.dart';

class HomePageContent extends StatefulWidget {
  const HomePageContent({Key? key}) : super(key: key);

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    context.read<HomeViewModel>().onErrorMessage =
        (value) => context.show(message: value);
    context.read<HomeViewModel>().getCameraPosition(context);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    context.read<HomeViewModel>().currentLocationStreamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ValueListenableBuilder<bool>(
        valueListenable: context.read<HomeViewModel>().isLoadingNotifier,
        builder: (_, value, __) {
          if (value) {
            return const Center(
            );
          } else {
            return Stack(
              children: [
                ValueListenableBuilder<double>(
                  valueListenable:
                      context.read<HomeViewModel>().panelHeightNotifier,
                  builder: (_, height, __) {
                    return
                      SlidingUpPanel(
                      maxHeight: 450.h,
                      minHeight: 40.h,
                      renderPanelSheet: false,
                      controller: context.read<HomeViewModel>().panelController,
                      body: const PanelBodyMap(),
                      panelBuilder: (sc) {
                        context.read<HomeViewModel>().panelScrollController =
                            sc;
                        return const MainPanel();
                      },
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.r),
                        topRight: Radius.circular(25.r),
                      ),
                      onPanelSlide: context.read<HomeViewModel>().onPanelSlide,
                    );
                  },
                ),
                Positioned(
                  top: 22.w,
                  left: 22.w,
                  right: 22.w,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ValueListenableBuilder<bool>(
                        valueListenable: context
                            .read<HomeViewModel>()
                            .showPreferencesNotifier,
                        builder: (_, value, __) {
                          if (value) {
                            return const ProfileBackButton();
                          } else {
                            return const SkipeeIcon();
                          }
                        },
                      ),
                      const PreferencesButton(),
                    ],
                  ),
                ),
                const MapLayersButton(),
                const MyLocationButton()
              ],
            );
          }
        },
      ),
    );
  }
}

class PanelBodyMap extends StatelessWidget {
  const PanelBodyMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      trafficEnabled:true,
      // buildingsEnabled: value,
      // mapType: values.elementAt(2),
      markers: context.read<HomeViewModel>().markers,
      onMapCreated: context.read<HomeViewModel>().onMapCreated,
      initialCameraPosition: context.read<HomeViewModel>().initialCameraPosition,
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
    );
  }
}
