import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skipee/app/globals.dart';
import '../../../../../../utils/constants/app_assets.dart';
import '../../../../../global_widgets/widgets/action_bar_widget.dart';
import '../../../../../global_widgets/widgets/bottom_sheet_main_title.dart';
import '../../../../../global_widgets/widgets/later_button.dart';
import '../../../../../global_widgets/widgets/send_button_widget.dart';

class OnRoadBottomSheet {
  OnRoadBottomSheet();
  void show() {
    showModalBottomSheet(
      context: navigatorKeyGlobal.currentContext!,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (context) => const OnRoadBottomSheetContent(),
    );
  }
}

class OnRoadBottomSheetContent extends StatelessWidget {
  const OnRoadBottomSheetContent({Key? key}) : super(key: key);

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
            padding: EdgeInsets.only(top: 26.h, bottom: 40.h),
            child: const BottomSheetMainTitleWidget(
              title: 'On road ',
              fontSize: 24,
            ),
          ),
          const ActionWidget(
              actionTitleImage: AppAssets.objectonRoadSvg,
              imageSize: 50,
              space: 16,
              fontSize: 14,
              actionTitle: 'Object on road '),
          SizedBox(
            height: 6.h,
          ),
          Divider(
            thickness: 1.sp,
          ),
          const ActionWidget(
              actionTitleImage: AppAssets.constructionSvg,
              imageSize: 64,
              space: 16,
              fontSize: 14,
              actionTitle: 'Construction'),
          Divider(
            thickness: 1.sp,
          ),
          SizedBox(
            height: 8.h,
          ),
          const ActionWidget(
              actionTitleImage: AppAssets.brokentrafficlightSvg,
              imageSize: 56,
              space: 16,
              fontSize: 14,
              actionTitle: 'Broken traffic light'),
          Divider(
            thickness: 1.sp,
          ),
          SizedBox(
            height: 8.h,
          ),
          const ActionWidget(
              actionTitleImage: AppAssets.potholeSvg,
              imageSize: 56,
              space: 16,
              fontSize: 14,
              actionTitle: 'Pothole'),
          Divider(
            thickness: 1.sp,
          ),
          SizedBox(
            height: 8.h,
          ),
          const ActionWidget(
              actionTitleImage: AppAssets.vehiclestoppedSvg,
              imageSize: 46,
              space: 20,
              fontSize: 13,
              actionTitle: 'Vehicle stopped'),
          Divider(
            thickness: 1.sp,
          ),
          const ActionWidget(
              actionTitleImage: AppAssets.roadkillSvg,
              imageSize: 48,
              space: 16,
              fontSize: 14,
              actionTitle: 'Road kill'),
          SizedBox(
            height: 30.h,
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
    );
  }
}
