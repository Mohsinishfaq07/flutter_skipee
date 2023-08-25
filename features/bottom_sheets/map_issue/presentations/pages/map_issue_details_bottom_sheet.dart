import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skipee/app/globals.dart';
import 'package:skipee/features/bottom_sheets/map_issue/presentations/pages/speed_limit_issues_bottom_sheet.dart';
import '../../../../../../utils/constants/app_assets.dart';
import '../../../../global_widgets/widgets/action_bar_widget.dart';
import '../../../../global_widgets/widgets/bottom_sheet_main_title.dart';
import '../../../../global_widgets/widgets/send_button_widget.dart';



class MapIssueDetailsBottomSheet {
  MapIssueDetailsBottomSheet();
  void show() {
    showModalBottomSheet(
      context: navigatorKeyGlobal.currentContext!,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (context) =>   const MapIssueDetailsBottomSheetContent(),
    );
  }
}
class MapIssueDetailsBottomSheetContent extends StatelessWidget {
  const   MapIssueDetailsBottomSheetContent({Key? key}) : super(key: key);

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
          const BottomSheetMainTitleWidget(
            title: 'Map Issue',
            space: 20,
            fontSize: 24,
          ),
          SizedBox(height: 6.h,),
          Divider(thickness: 1.sp,),
          const Padding(
            padding: EdgeInsets.only(top: 4,bottom: 4),
            child: ActionWidget(
              actionTitleImage: AppAssets.missingexitSvg,
              imageSize: 34,
              fontSize: 13,
              space: 16,
              actionTitle: 'General map error',
            ),
          ),
          Divider(thickness: 1.sp,),
          const Padding(
            padding: EdgeInsets.only(top: 4,bottom: 4),
            child: ActionWidget(
              actionTitleImage: AppAssets.turnnotallowedSvg,
              imageSize: 34,
              fontSize: 13,
              space: 16,
              actionTitle: 'Turn not allowed',
            ),
          ),
          Divider(thickness: 1.sp,),
          const Padding(
            padding: EdgeInsets.only(top: 4,bottom: 4),
            child: ActionWidget(
              actionTitleImage: AppAssets.incorrectaddressSvg,
              imageSize: 34,
              fontSize: 13,
              space: 16,
              actionTitle: 'Incorrect address',
            ),
          ),
          Divider(thickness: 1.sp,),
          const Padding(
            padding: EdgeInsets.only(top: 4,bottom: 4),
            child: ActionWidget(
              actionTitleImage: AppAssets.missingexitSvg,
              imageSize: 34,
              fontSize: 13,
              space: 16,
              actionTitle: 'Incorrect junction',
            ),
          ),
          Divider(thickness: 1.sp,),
          Padding(
            padding:  EdgeInsets.only(top: 4.sp,bottom: 4.sp),
            child: ActionWidget(
              actionTitleImage: AppAssets.speedometerSvg,
              imageSize: 34,
              fontSize: 13,
              space: 16,
              actionTitle: 'Speed limit issue',
              onTap:()=>  SpeedLimitBottomSheet().show(),
            ),
          ),
          Divider(thickness: 1.sp,),const Padding(
            padding: EdgeInsets.only(top: 4,bottom: 4),
            child: ActionWidget(
              actionTitleImage: AppAssets.missingexitSvg,
              imageSize: 34,
              fontSize: 13,
              space: 16,
              actionTitle: 'Missing Bridge or overpass',
            ),
          ),
          Divider(thickness: 1.sp,),
          const Padding(
            padding: EdgeInsets.only(top: 4,bottom: 4),
            child: ActionWidget(
              actionTitleImage: AppAssets.wrongdrivingaddressSvg,
              imageSize: 34,
              fontSize: 13,
              space: 16,
              actionTitle: 'Wrong driving address',
            ),
          ),
          Divider(thickness: 1.sp,),
          const Padding(
            padding: EdgeInsets.only(top: 4,bottom: 4),
            child: ActionWidget(
              actionTitleImage: AppAssets.missingexitSvg,
              imageSize: 34,
              fontSize: 13,
              space: 16,
              actionTitle: 'Missing exit',
            ),
          ),
          Divider(thickness: 1.sp,),const Padding(
            padding: EdgeInsets.only(top: 4,bottom: 20),
            child: ActionWidget(
              actionTitleImage: AppAssets.missingroadSvg,
              imageSize: 34,
              fontSize: 13,
              space: 16,
              actionTitle: 'Missing road',
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(right: 20.0,bottom: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                SendButtonWidget(
                  title: 'Send',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
