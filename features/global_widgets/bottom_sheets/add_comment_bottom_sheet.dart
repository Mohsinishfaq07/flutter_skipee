import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utils/constants/app_assets.dart';
import '../../../app/globals.dart';
import '../widgets/later_button.dart';
import '../widgets/send_button_widget.dart';

class AddCommentBottomSheet {
  AddCommentBottomSheet();
  void show() {
    showModalBottomSheet(
      context: navigatorKeyGlobal.currentContext!,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (context) => const AddCommentBottomSheetContent(),
    );
  }
}

class AddCommentBottomSheetContent extends StatelessWidget {
  const AddCommentBottomSheetContent({Key? key}) : super(key: key);

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
        padding: EdgeInsets.only(top: 40.h, left: 10.sp, right: 10.sp),
        child: Stack(
          children: [
            SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 28.sp,
                        ),
                        onTap: () => Navigator.pop(context),
                      ),
                      SvgPicture.asset(AppAssets.greentickSvg, height: 20.h),
                    ],
                  ),

                  Expanded(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(vertical: 10.h),
                      child: TextFormField(
                        maxLines: 34,
                        decoration: InputDecoration(
                          hintText: 'Share details here...',
                          contentPadding:
                              EdgeInsets.only(left: 20.sp, top: 14.sp),
                          hintStyle: TextStyle(fontSize: 20.sp),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                        ),
                      ),
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
            ),
            Positioned(
                bottom: 70,
                left: 10,
                child:
                    SvgPicture.asset(AppAssets.voiceRecording, height: 70.h)),
          ],
        ),
      ),
    );
  }
}
