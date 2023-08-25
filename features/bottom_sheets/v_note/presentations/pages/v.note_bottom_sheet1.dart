import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skipee/features/bottom_sheets/v_note/presentations/pages/v.note_bottom_sheet_2.dart';
import '../../../../../app/globals.dart';
import '../../../../../utils/constants/app_assets.dart';
import '../../../../global_widgets/widgets/send_button_widget.dart';
import '../widgets/triangle_clipper.dart';

class VoiceNoteBottomSheet1 {
  VoiceNoteBottomSheet1();
  void show() {
    showModalBottomSheet(
      context: navigatorKeyGlobal.currentContext!,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (context) => const VoiceNoteBottomSheet1Content(),
    );
  }
}

class VoiceNoteBottomSheet1Content extends StatelessWidget {
  const VoiceNoteBottomSheet1Content({Key? key}) : super(key: key);

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
        padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: const Icon(Icons.arrow_back),
                  onTap: () => Navigator.pop(context),
                ),
                Row(
                  children: [
                    const Icon(Icons.circle_outlined),
                    SizedBox(
                      width: 4.w,
                    ),
                    Container(
                        height: 28.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: Colors.black)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('00:00'),
                            Icon(Icons.arrow_drop_down),
                          ],
                        )),
                  ],
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 30, bottom: 30.h),
              child: Text('What are you looking for ?',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Theme.of(context).primaryColor,
                      // fontSize: fontSize.sp,
                      fontWeight: FontWeight.bold)),
            ),
            const Text('Try Saying:'),
            SizedBox(
              height: 8.h,
            ),
            Center(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 180.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Text('I need help...',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: Theme.of(context).primaryColor,
                            // fontSize: fontSize.sp,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 110.w),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: ClipPath(
                      clipper: TriangleClipper(),
                      child: Container(
                        height: 16,
                        width: 20,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )),
            SvgPicture.asset(
              AppAssets.micIcon,
              height: 150.h,
            ),
            SizedBox(
              height: 10.h,
            ),
            SendButtonWidget(
              title: 'next',
              ontap: () => VNoteBottomSheet2().show(),
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
