import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skipee/app/globals.dart';
import 'package:skipee/features/bottom_sheets/map_issue/presentations/pages/speed_limit_issues_bottom_sheet.dart';
import '../../../../../../utils/constants/app_assets.dart';
import '../../../../global_widgets/widgets/action_bar_widget.dart';
import '../../../../global_widgets/widgets/bottom_sheet_main_title.dart';
import '../../../../global_widgets/widgets/custom_speed_limit_widget.dart';
import '../../../../global_widgets/widgets/send_button_widget.dart';



class SpeedLimitBottomSheet {
  SpeedLimitBottomSheet();
  void show() {
    showModalBottomSheet(
      context: navigatorKeyGlobal.currentContext!,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (context) => const SpeedLimitBottomSheetContent(),
    );
  }
}

class SpeedLimitBottomSheetContent extends StatelessWidget {
  const SpeedLimitBottomSheetContent({Key? key}) : super(key: key);

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
            padding: EdgeInsets.only(top: 24.sp, bottom: 10.sp),
            child: const BottomSheetMainTitleWidget(
              title: 'Speed Limit alerts',
              fontSize: 26,
            ),
          ),
          Divider(
            thickness: 1.sp,
          ),
          const CustomSpeedLimitWidget(
            titleImage: AppAssets.speedicon,
            imageSize: 50,
            title: '50 ',
            space: 18,
            fontSize: 20,
            title2: 'km/h',
          ),
          Divider(
            thickness: 1.sp,
          ),
          const CustomSpeedLimitWidget(
            titleImage: AppAssets.speedicon,
            imageSize: 50,
            title: '90 ',
            space: 18,
            fontSize: 20,
            title2: 'km/h',
          ),
          Divider(
            thickness: 1.sp,
          ),
          const CustomSpeedLimitWidget(
            titleImage: AppAssets.speedicon,
            imageSize: 50,
            title: '100 ',
            space: 18,
            fontSize: 20,
            title2: 'km/h',
          ),
          Divider(
            thickness: 1.sp,
          ),
          const CustomSpeedLimitWidget(
            titleImage: AppAssets.speedicon,
            imageSize: 50,
            space: 18,
            fontSize: 20,
            title2: 'Other  ',
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}
