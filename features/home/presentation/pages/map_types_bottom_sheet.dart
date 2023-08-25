import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:skipee/features/home/presentation/manager/home_view_model.dart';
import '../../../../../utils/constants/app_assets.dart';
import '../../../../app/globals.dart';
import '../../../global_widgets/widgets/map_type_item.dart';

class MapTypesBottomSheet {
  final BuildContext context;

  MapTypesBottomSheet(this.context);

  HomeViewModel get _homeViewModel => sl();

  Future show() {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      builder: (_) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.r), topRight: Radius.circular(15.r)),
        ),
        padding:
            EdgeInsets.only(left: 22.w, right: 22.w, bottom: 22.w, top: 10.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 4.h,
                width: 40.w,
                decoration: const ShapeDecoration(
                  shape: StadiumBorder(),
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Text('Map Type',
                style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MapTypeItem(
                  name: 'Default',
                  iconPath: AppAssets.defaultMapSvg,
                  isActive:
                      _homeViewModel.mapDetailsType.value == MapType.normal,
                  onTap: () {
                    _homeViewModel.mapDetailsType.value = MapType.normal;
                    Navigator.of(context).pop();
                  },
                ),
                MapTypeItem(
                  name: 'Satellite',
                  iconPath: AppAssets.satelliteMapSvg,
                  isActive:
                      _homeViewModel.mapDetailsType.value == MapType.hybrid,
                  onTap: () {
                    _homeViewModel.mapDetailsType.value = MapType.hybrid;
                    Navigator.of(context).pop();
                  },
                ),
                MapTypeItem(
                  name: 'Terrine',
                  iconPath: AppAssets.terrineMapSvg,
                  isActive:
                      _homeViewModel.mapDetailsType.value == MapType.terrain,
                  onTap: () {
                    _homeViewModel.mapDetailsType.value = MapType.terrain;
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            SizedBox(height: 22.h),
            Text('Map Details',
                style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MapTypeItem(
                  name: 'Traffic',
                  iconPath: AppAssets.trafficMapSvg,
                  isActive: _homeViewModel.trafficMapTypeNotifier.value,
                  onTap: () {
                    _homeViewModel.trafficMapTypeNotifier.value =
                        !_homeViewModel.trafficMapTypeNotifier.value;
                    Navigator.of(context).pop();
                  },
                ),
                MapTypeItem(
                  name: '3D',
                  iconPath: AppAssets.threeDMapType,
                  isActive: _homeViewModel.threeDMapTypeNotifier.value,
                  onTap: () {
                    _homeViewModel.threeDMapTypeNotifier.value =
                        !_homeViewModel.threeDMapTypeNotifier.value;
                    Navigator.of(context).pop();
                  },
                ),
                SizedBox(width: 40.w),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
