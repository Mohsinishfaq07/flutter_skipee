import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../app/globals.dart';
import '../../../../../../utils/constants/app_assets.dart';
import '../../../../global_widgets/widgets/bottom_sheet_main_title.dart';
import '../../../../global_widgets/widgets/category_widget.dart';
import '../../../../global_widgets/widgets/custom_close_bottom_sheet_widget.dart';
import '../../../../global_widgets/widgets/send_button_widget.dart';
import 'emergency_call_bottom_sheet/emergency_call_bottom_sheet.dart';
import 'fellow_wezzers_bottom_sheet/fellow_wezzers_bottom_sheet.dart';


class RoadHelpBottomSheet {
  RoadHelpBottomSheet();
  void show() {
    showModalBottomSheet(
      context: navigatorKeyGlobal.currentContext!,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (context) => const RoadHelpBottomSheetContent(),
    );
  }
}

class RoadHelpBottomSheetContent extends StatelessWidget {
  const RoadHelpBottomSheetContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0.r),
            topRight: Radius.circular(30.0.r),
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 6.w, top: 26.h),
            child: const Align(
              alignment: Alignment.topRight,
              child: CloseBottomSheetWidget(),
            ),
          ),
          const BottomSheetMainTitleWidget(
            titleImage: AppAssets.roadhelpSvg,
            imageSize: 112,
            space: 30,
            title: 'Road Help',
            fontSize: 28,
          ),
          Container(
            width: 400.w,
            height: 122.h,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey),
                bottom: BorderSide(color: Colors.grey),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BottomSheetCategory(
                  categoryImage: AppAssets.fellowWezersSvg,
                  imageSize: 56,
                  categoryTitle: 'Fellow  Wazers',
                  fontSize: 14,
                  onTap: () {
                    FellowWezersBottomSheet().show();
                  },
                ),
                SizedBox(
                  width: 8.w,
                ),
                VerticalDivider(
                  thickness: 2.sp,
                ),
                SizedBox(
                  width: 10.w,
                ),
                BottomSheetCategory(
                  categoryImage: AppAssets.emergencyCallSvg,
                  imageSize: 50,
                  categoryTitle: 'Emergency call',
                  fontSize: 14,
                  onTap: () {
                    EmergencyCallBottomSheet().show();
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Text('Having car trouble?',
              style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold)),
          Text('Easily request roadside help.',
              style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold)),
          Text('Your fellow wazers will see you ',
              style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold)),
          Text('request and location on the map. ',
              style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold)),
          Padding(
            padding: EdgeInsets.only(top: 34.h, bottom: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50.h,
                  width: 60.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black12,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      AppAssets.locationButton,
                      height: 20.h,
                    ),
                  ),
                ),
                const SendButtonWidget(
                  title: 'Request',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
