import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../app/globals.dart';
import '../../../../../../utils/constants/app_assets.dart';
import '../../../../../global_widgets/widgets/action_bar_widget.dart';
import '../../../../../global_widgets/widgets/bottom_sheet_main_title.dart';
import '../../../../../global_widgets/widgets/later_button.dart';
import '../../../../../global_widgets/widgets/send_button_widget.dart';

class FellowWezersBottomSheet {
  FellowWezersBottomSheet();
  void show() {
    showModalBottomSheet(
      context: navigatorKeyGlobal.currentContext!,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (context) => const FellowWezersBottomSheetContent(),
    );
  }
}
class FellowWezersBottomSheetContent extends StatelessWidget {
  const   FellowWezersBottomSheetContent({Key? key}) : super(key: key);

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
          SizedBox(height: 40.h,),
          const BottomSheetMainTitleWidget(
            title: "What's wrong ",
            fontSize: 24,
          ),
          Padding(
            padding:  EdgeInsets.only(top: 30.sp,bottom: 10.sp,left: 20.sp),
            child: const ActionWidget(
              actionTitleImage: AppAssets.outOfGas,
              imageSize: 52,
              space: 46,
              fontSize: 14,
              actionTitle: 'Out of gas',),
          ),
          Divider(thickness: 1.sp,),
          Padding(
            padding: EdgeInsets.only(top: 10.h,left: 20.sp,bottom: 10 ),
            child: const ActionWidget(
                actionTitleImage: AppAssets.flatTyre,
                space: 46,
                imageSize: 52,
                fontSize: 14,
                actionTitle: 'Flat tire'),
          ),
          Divider(thickness: 1.sp,),
          Padding(
            padding:  EdgeInsets.only(left: 20.sp,top: 10.sp,bottom: 12),
            child: const ActionWidget(
                actionTitleImage: AppAssets.batteryissue,
                space: 46,
                fontSize: 14,
                imageSize: 50,
                actionTitle: 'Battery Issue'),
          ),

          Divider(thickness: 1.sp,),
          Padding(
            padding:  EdgeInsets.only(top: 10.h,bottom: 10.h,left: 20.sp),
            child: const ActionWidget(
                actionTitleImage: AppAssets.medicalissue,
                imageSize: 52,
                fontSize: 14,
                space: 46,
                actionTitle: 'medical issue '),
          ),
          Divider(thickness: 1.sp,),
          Padding(
            padding:  EdgeInsets.only(top: 6.sp,left: 20,bottom: 42),
            child: const ActionWidget(
                actionTitleImage: AppAssets.fellowWezersSvg,
                imageSize: 48,
                space: 46,
                fontSize: 14,
                actionTitle: 'Other'),
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
          SizedBox(height: 10.h,),

        ],
      ),
    );
  }
}
