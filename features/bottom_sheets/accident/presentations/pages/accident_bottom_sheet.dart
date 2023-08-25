import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../app/globals.dart';
import '../../../../../utils/File Picker/image_picker.dart';
import '../../../../../utils/constants/app_assets.dart';
import '../../../../global_widgets/bottom_sheets/add_comment_bottom_sheet.dart';
import '../../../../global_widgets/bottom_sheets/add_voice_note_bottom_sheet.dart';
import '../../../../global_widgets/widgets/action_bar_widget.dart';
import '../../../../global_widgets/widgets/bottom_sheet_main_title.dart';
import '../../../../global_widgets/widgets/category_widget.dart';
import '../../../../global_widgets/widgets/custom_close_bottom_sheet_widget.dart';
import '../../../../global_widgets/widgets/later_button.dart';
import '../../../../global_widgets/widgets/send_button_widget.dart';

class AccidentBottomSheet {
  AccidentBottomSheet();
  void show() {
    showModalBottomSheet(
      context: navigatorKeyGlobal.currentContext!,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (context) => const AccidentBottomSheetContent(),
    );
  }
}

class AccidentBottomSheetContent extends StatelessWidget {
  const AccidentBottomSheetContent({Key? key}) : super(key: key);

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
            titleImage: AppAssets.accidentMainSvg,
            imageSize: 90,
            space: 30,
            title: 'Accident',
            fontSize: 29,
          ),
          SizedBox(height: 16.h),
          Container(
            width: 400.w,
            height: 116.h,
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
                  categoryImage: AppAssets.mildSvg,
                  imageSize: 50,
                  categoryTitle: 'Mild',
                  fontSize: 14,
                  onTap: () {},
                ),
                Container(
                  color: Colors.black12,
                  width: 1,
                  height: double.infinity,
                ),
                BottomSheetCategory(
                  categoryImage: AppAssets.majorSvg,
                  imageSize: 46,
                  categoryTitle: 'Major',
                  space: 2,
                  fontSize: 14,
                  onTap: () {},
                ),
                Container(
                  color: Colors.black12,
                  width: 1,
                  height: double.infinity,
                ),
                BottomSheetCategory(
                  categoryImage: AppAssets.otherSideSvg,
                  imageSize: 40,
                  space: 10,
                  categoryTitle: 'Other Side',
                  fontSize: 14,
                  onTap: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.w, top: 22.h),
            child: GestureDetector(
              onTap: () async {
                await getImageFromCamera();
              },
              child: const ActionWidget(
                actionTitleImage: AppAssets.cameraSvg,
                imageSize: 50,
                fontSize: 14,
                space: 30,
                actionTitle: 'Take Picture',
              ),
            ),
          ),
          Divider(
            thickness: 1.sp,
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.sp, top: 16.sp, bottom: 4.sp),
            child: ActionWidget(
              actionTitleImage: AppAssets.micSvg,
              imageSize: 50,
              space: 30,
              actionTitle: 'Add Voice Note',
              fontSize: 14,
              onTap: () => AddVoiceNoteBottomSheet().show(),
            ),
          ),
          Divider(
            thickness: 1.sp,
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.sp, bottom: 20, top: 10.sp),
            child: ActionWidget(
              actionTitleImage: AppAssets.commentSvg,
              imageSize: 40,
              fontSize: 14,
              space: 30,
              actionTitle: 'Add comments',
              onTap: () => AddCommentBottomSheet().show(),
            ),
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
