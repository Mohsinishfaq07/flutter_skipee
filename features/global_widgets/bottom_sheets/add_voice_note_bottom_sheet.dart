import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_shadow/simple_shadow.dart';
import '../../../../utils/constants/app_assets.dart';
import '../../../app/globals.dart';
import '../widgets/later_button.dart';
import '../widgets/send_button_widget.dart';


class AddVoiceNoteBottomSheet {
  AddVoiceNoteBottomSheet();
  void show() {
    showModalBottomSheet(
      context: navigatorKeyGlobal.currentContext!,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (context) => const AddVoiceNoteBottomSheetContent(),
    );
  }
}

class AddVoiceNoteBottomSheetContent extends StatefulWidget {
  const AddVoiceNoteBottomSheetContent({Key? key}) : super(key: key);

  @override
  State<AddVoiceNoteBottomSheetContent> createState() =>
      _AddVoiceNoteBottomSheetContentState();
}

class _AddVoiceNoteBottomSheetContentState
    extends State<AddVoiceNoteBottomSheetContent> {
  bool isVoiceRecording = false;

  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0.r),
            topRight: Radius.circular(30.0.r),
          )),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50.h, bottom: 10.h),
                  child: Row(
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
                ),
                Expanded(
                  child: TextFormField(
                    maxLines: 33,
                    decoration: InputDecoration(
                      hintText: 'Share details here...',
                      contentPadding: EdgeInsets.only(left: 20.sp, top: 14.sp),
                      hintStyle: TextStyle(fontSize: 20.sp),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                  child: Row(
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
                ),
              ],
            ),
          ),
          Positioned(
              child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black12,
          )),
          Positioned(
              bottom: 90,
              left: 30,
              child: SimpleShadow(
                color: Colors.white,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isVoiceRecording = !isVoiceRecording;
                    });
                  },
                  child:
                      SvgPicture.asset(AppAssets.voiceRecording, height: 70.h),
                  excludeFromSemantics: isSelected = isVoiceRecording,
                ),
              )),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            layoutBuilder: (currentChild, previousChildren) => isVoiceRecording
                ? Center(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.r)),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40.w, vertical: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(AppAssets.clipboard),
                                Icon(
                                  Icons.delete,
                                  color: Colors.black,
                                  size: 40.sp,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 56,
                            width: 220,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.r),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Align(
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SvgPicture.asset(AppAssets.recordingWaves),
                                    const Text('01:32')
                                  ],
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                LaterButtonWidget(
                                  title: 'Cancel',
                                ),
                                SendButtonWidget(
                                  title: 'Send',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    ),
                  )
                : Column(
                    children: const [],
                  ),
          ),
        ],
      ),
    );
  }
}
