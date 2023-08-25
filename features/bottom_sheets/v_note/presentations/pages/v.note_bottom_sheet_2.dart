import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../app/globals.dart';
import '../../../../../utils/constants/app_assets.dart';
import '../../../../global_widgets/widgets/custom_appbar_2.dart';
import '../../../../global_widgets/widgets/later_button.dart';
import '../../../../global_widgets/widgets/send_button_widget.dart';

class VNoteBottomSheet2 {
  VNoteBottomSheet2();
  void show() {
    showModalBottomSheet(
      context: navigatorKeyGlobal.currentContext!,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (context) => const VNoteBottomSheet2Content(),
    );
  }
}

class VNoteBottomSheet2Content extends StatefulWidget {
  const VNoteBottomSheet2Content({Key? key}) : super(key: key);

  @override
  State<VNoteBottomSheet2Content> createState() =>
      _VNoteBottomSheet2ContentState();
}

class _VNoteBottomSheet2ContentState extends State<VNoteBottomSheet2Content> {
  bool isVoiceRecording = false;
  bool isSelected = true;
  bool excludeFromSemantics = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromRGBO(250, 250, 250, 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0.r),
            topRight: Radius.circular(30.0.r),
          )),
      child: Stack(children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CustomAppbar2(),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0.r),
                  topRight: Radius.circular(30.0.r),
                ),
              ),
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: 30.w, right: 30.w, top: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(AppAssets.clipboard),
                        Icon(
                          Icons.delete,
                          size: 36.sp,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.h, bottom: 10.h),
                    child: Container(
                      height: 54.h,
                      width: 210.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Recording 1508.mp3',
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                  color: Theme.of(context).primaryColor,
                                  // fontSize: fontSize.sp,
                                  fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  SendButtonWidget(
                    title: 'Save',
                    ontap: () => setState(() {
                      isVoiceRecording = !isVoiceRecording;
                    }),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 200,
          left: 46,
          child: Opacity(
            opacity: 0.2,
            child: SvgPicture.asset(
              AppAssets.micIcon,
              height: 280.h,
            ),
          ),
        ),
        Positioned(
            top: 210,
            left: 20,
            child: Column(
              children: [
                SvgPicture.asset(
                  AppAssets.recordingWaves,
                  height: 70.sp,
                ),
                Text(
                  '00:04:34',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: Theme.of(context).primaryColor,
                      // fontSize: fontSize.sp,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )),
        Positioned(
          top: 300,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            layoutBuilder: (currentChild, previousChildren) => isVoiceRecording
                ? Card(
                    child: Container(
                      decoration: const BoxDecoration(color: Colors.white),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.black,
                                  size: 28.sp,
                                ),
                                onTap: () => Navigator.pop(context),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 60.h),
                                child: Text('Recording',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        ?.copyWith(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 24.sp,
                                            fontWeight: FontWeight.bold)),
                              ),
                              Icon(
                                Icons.more_vert_sharp,
                                color: Colors.black,
                                size: 28.sp,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 20),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.play_circle_filled_rounded,
                                  size: 50.h,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text('Recording 1508.mp3  ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        ?.copyWith(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold)),
                                Text('00:04:34',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        ?.copyWith(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.h, bottom: 30),
                            child: SvgPicture.asset(AppAssets.recordingWaves),
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
                  )
                : Column(
                    children: const [],
                  ),
          ),
        ),
      ]),
    );
  }
}
