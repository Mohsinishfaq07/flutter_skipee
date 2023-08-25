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


class TCongestionBottomSheet {
  TCongestionBottomSheet();
  void show() {
    showModalBottomSheet(
      context: navigatorKeyGlobal.currentContext!,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (context) => const TCongestionBottomSheetContent(),
    );
  }
}

class TCongestionBottomSheetContent extends StatelessWidget {
  const TCongestionBottomSheetContent({Key? key}) : super(key: key);

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
            padding: EdgeInsets.only(right: 6.w, top: 18.h),
            child: const Align(
              alignment: Alignment.topRight,
              child: CloseBottomSheetWidget(),
            ),
          ),

          const Padding(
            padding:  EdgeInsets.symmetric(vertical: 16),
            child: BottomSheetMainTitleWidget(
              titleImage: AppAssets.tcongestionSvg,
              imageSize: 80,
              title: 'T. Congestion',
              space: 32,
              fontSize: 29,
            ),
          ),

          Container(
            width: 400.w,
            height: 126.h,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.black26),
                bottom: BorderSide(color: Colors.black26),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BottomSheetCategory(
                    categoryImage: AppAssets.minorSvg,
                    imageSize: 40,
                    space: 8,
                    fontSize: 14,
                    categoryTitle: 'Minor',
                    onTap: () {}),
                Container(
                  color: Colors.black12,
                  width: 1,
                  height: double.infinity,
                ),
                BottomSheetCategory(
                    categoryImage: AppAssets.heavytrafficSvg,
                    imageSize: 40,
                    categoryTitle: 'Heavy Traffic',
                    space: 8,
                    fontSize: 14,
                    onTap: () {}),
                Container(
                  color: Colors.black12,
                  width: 1,
                  height: double.infinity,
                ),
                BottomSheetCategory(
                    categoryImage: AppAssets.standstillSvg,
                    imageSize: 40,
                    categoryTitle: 'Standstill',
                    fontSize: 14,
                    space: 8,
                    onTap: () {}),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.only(top: 18.0, left: 18.w, bottom: 4.h),
            child: ActionWidget(
              actionTitleImage: AppAssets.cameraSvg,
              imageSize: 50,
              space: 28,
              actionTitle: 'Take Picture',
              fontSize: 16,
              onTap: () async {
                await getImageFromCamera();
              },
            ),
          ),
          Divider(
            thickness: 1.sp,
          ),
          Padding(
            padding: EdgeInsets.only(top: 14.0.sp, left: 18.sp, bottom: 10.sp),
            child: ActionWidget(
              actionTitleImage: AppAssets.micSvg,
              imageSize: 46,
              space: 28,
              fontSize: 16,
              actionTitle: 'Add Voice Note',
              onTap: () {
                AddVoiceNoteBottomSheet().show();
              },
            ),
          ),
          Divider(
            thickness: 1.sp,
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0.sp, left: 18.sp, bottom: 20.sp),
            child: ActionWidget(
              actionTitleImage: AppAssets.commentSvg,
              imageSize: 46,
              space: 28,
              fontSize: 14,
              actionTitle: 'Add Comments',
              onTap: () {
                showModalBottomSheet<void>(
                    isScrollControlled: true,
                    context: navigatorKeyGlobal.currentContext!,
                    builder: (BuildContext context) {
                      return const AddCommentBottomSheetContent();
                    });
              },
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
