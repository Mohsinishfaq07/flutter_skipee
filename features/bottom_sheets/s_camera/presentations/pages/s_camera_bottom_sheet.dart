import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../app/globals.dart';
import '../../../../../utils/File Picker/image_picker.dart';
import '../../../../../utils/constants/app_assets.dart';
import '../../../../global_widgets/bottom_sheets/add_comment_bottom_sheet.dart';
import '../../../../global_widgets/widgets/action_bar_widget.dart';
import '../../../../global_widgets/widgets/bottom_sheet_main_title.dart';
import '../../../../global_widgets/widgets/custom_close_bottom_sheet_widget.dart';
import '../../../../global_widgets/widgets/later_button.dart';
import '../../../../global_widgets/widgets/send_button_widget.dart';


class SCameraBottomSheet {
  SCameraBottomSheet();
  void show() {
    showModalBottomSheet(
      context: navigatorKeyGlobal.currentContext!,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (context) => const SCameraBottomSheetContent(),
    );
  }
}

class SCameraBottomSheetContent extends StatelessWidget {
  const SCameraBottomSheetContent({Key? key}) : super(key: key);

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
            padding: EdgeInsets.only(right: 6.w, top: 28.h),
            child: const Align(
              alignment: Alignment.topRight,
              child: CloseBottomSheetWidget(),
            ),
          ),
          const BottomSheetMainTitleWidget(
            titleImage: AppAssets.scameraSvg,
            imageSize: 72,
            space: 30,
            title: 'S. Camera',
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.sp,vertical: 4),
            child: ActionWidget(
              actionTitleImage: AppAssets.cameraSvg,
              imageSize: 50,
              space: 17,
              actionTitle: 'Take Picture',
              fontSize: 15,
              onTap:()async{
                await getImageFromCamera();
              },
            ),
          ),
          Divider(
            thickness: 1.sp,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.sp,vertical: 4),
            child: ActionWidget(
              actionTitleImage: AppAssets.commentSvg,
              imageSize: 46,
              space: 17,
              fontSize: 15,
              actionTitle: 'Add comments',
              onTap: () {
               AddCommentBottomSheet().show();
              },
            ),
          ),
          SizedBox(height: 28.h,),
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
