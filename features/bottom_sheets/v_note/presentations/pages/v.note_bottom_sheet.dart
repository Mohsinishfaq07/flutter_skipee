import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skipee/features/bottom_sheets/v_note/presentations/pages/v.note_bottom_sheet1.dart';

import '../../../../../app/globals.dart';
import '../../../../../utils/constants/app_assets.dart';
import '../../../../global_widgets/widgets/bottom_sheet_main_title.dart';
import '../../../../global_widgets/widgets/custom_close_bottom_sheet_widget.dart';
import '../../../../global_widgets/widgets/send_button_widget.dart';



class VoiceNoteBottomSheet {
  VoiceNoteBottomSheet();
  void show() {
    showModalBottomSheet(
      context: navigatorKeyGlobal.currentContext!,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (context) => const VoiceNoteBottomSheetContent(),
    );
  }
}

class VoiceNoteBottomSheetContent extends StatelessWidget {
  const VoiceNoteBottomSheetContent({Key? key}) : super(key: key);

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
            titleImage: AppAssets.micSvg,
            imageSize: 74,
            space: 32,
            title: 'V. Note',
          ),
          SizedBox(height: 12.h),
          SvgPicture.asset(
            AppAssets.micIcon,
            height: 150.h,
          ),
          SizedBox(
            height: 30.h,
          ),
          SendButtonWidget(
            title: 'Start',
            ontap: () {
              VoiceNoteBottomSheet1().show();
            },
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}
