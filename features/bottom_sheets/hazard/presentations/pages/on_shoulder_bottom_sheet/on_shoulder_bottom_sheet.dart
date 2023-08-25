import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skipee/app/globals.dart';
import '../../../../../../utils/constants/app_assets.dart';
import '../../../../../global_widgets/widgets/action_bar_widget.dart';
import '../../../../../global_widgets/widgets/bottom_sheet_main_title.dart';

class OnShoulderBottomSheet {
  OnShoulderBottomSheet();
  void show() {
    showModalBottomSheet(
      context: navigatorKeyGlobal.currentContext!,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (context) => const OnShoulderBottomSheetContent(),
    );
  }
}
class OnShoulderBottomSheetContent extends StatelessWidget {
  const   OnShoulderBottomSheetContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0.r),
            topRight: Radius.circular(30.0.r),
          )),

      child: Padding(
        padding: EdgeInsets.only( top: 30.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const BottomSheetMainTitleWidget(
              title: 'On Shoulder ',
              fontSize: 22,
            ),
            Divider(thickness: 1.sp,),
            const ActionWidget(
                actionTitleImage: AppAssets.vehiclestoppedSvg,
                imageSize: 50,
                space: 42,
                fontSize: 14,
                actionTitle: 'Vehicle stopped'),
            SizedBox(height: 4.h,),
            Divider(thickness: 1.sp,),
             const ActionWidget(
                actionTitleImage: AppAssets.roadkillSvg,
                imageSize: 50,
                space: 40,
                fontSize: 14,
                actionTitle: 'Animals'),
            SizedBox(height: 6.h,),
            Divider(thickness: 1.sp,),
             SizedBox(height: 6.h,),
             const ActionWidget(
                actionTitleImage: AppAssets.missingsignSvg,
                imageSize: 50,
                space: 40,
                fontSize: 14,
                actionTitle: 'Missing sign'),
            SizedBox(height: 10.h,),

          ],
        ),
      ),
    );
  }
}
