import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skipee/app/globals.dart';
import '../../../../../../utils/constants/app_assets.dart';
import '../../../../../global_widgets/widgets/action_bar_widget.dart';
import '../../../../../global_widgets/widgets/bottom_sheet_main_title.dart';
import '../../../../../global_widgets/widgets/later_button.dart';
import '../../../../../global_widgets/widgets/send_button_widget.dart';



class WeatherHazardBottomSheet {
  WeatherHazardBottomSheet();
  void show() {
    showModalBottomSheet(
      context: navigatorKeyGlobal.currentContext!,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (context) => const WeatherHazardBottomSheetContent(),
    );
  }
}

class WeatherHazardBottomSheetContent extends StatelessWidget {
  const WeatherHazardBottomSheetContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0.r),
            topRight: Radius.circular(30.0.r),
          )),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 40.h,
            ),
            const BottomSheetMainTitleWidget(
              title: 'Weather hazard ',
              fontSize: 22,
            ),
            SizedBox(
              height: 30.h,
            ),
            Divider(
              thickness: 1.sp,
            ),
            const ActionWidget(
              actionTitleImage: AppAssets.fogSvg,
              imageSize: 56,
              space: 46,
              fontSize: 14,
              actionTitle: 'Fog',
            ),
            Divider(
              thickness: 1.sp,
            ),
            const ActionWidget(
                actionTitleImage: AppAssets.hailSvg,
                space: 46,
                imageSize: 52,
                fontSize: 14,
                actionTitle: 'Hail'),
            SizedBox(
              height: 4.h,
            ),
            Divider(
              thickness: 1.sp,
            ),
            SizedBox(
              height: 8.h,
            ),
            const ActionWidget(
                actionTitleImage: AppAssets.floodSvg,
                space: 46,
                fontSize: 14,
                imageSize: 54,
                actionTitle: 'flood'),
            SizedBox(
              height: 2.h,
            ),
            Divider(
              thickness: 1.sp,
            ),
            SizedBox(
              height: 8.h,
            ),
            const ActionWidget(
                actionTitleImage: AppAssets.iceonroadSvg,
                imageSize: 56,
                fontSize: 14,
                space: 46,
                actionTitle: 'Ice on road '),
            SizedBox(
              height: 4.h,
            ),
            Divider(
              thickness: 1.sp,
            ),
            SizedBox(
              height: 10.h,
            ),
            const ActionWidget(
                actionTitleImage: AppAssets.unplowedroadSvg,
                imageSize: 52,
                space: 46,
                fontSize: 14,
                actionTitle: 'Unpowered road'),
            SizedBox(
              height: 48.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                LaterButtonWidget(
                  title: 'Later',
                ),
                SendButtonWidget(
                  title: 'Send',
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
