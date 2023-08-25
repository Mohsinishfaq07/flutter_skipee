import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skipee/app/globals.dart';
import '../../../../../../utils/File Picker/image_picker.dart';
import '../../../../../../utils/constants/app_assets.dart';
import '../../../../../global_widgets/bottom_sheets/add_comment_bottom_sheet.dart';
import '../../../../../global_widgets/widgets/action_bar_widget.dart';
import '../../../../../global_widgets/widgets/bottom_sheet_main_title.dart';
import '../../../../../global_widgets/widgets/category_widget.dart';
import '../../../../../global_widgets/widgets/custom_close_bottom_sheet_widget.dart';
import '../../../../../global_widgets/widgets/later_button.dart';
import '../../../../../global_widgets/widgets/send_button_widget.dart';
import '../on_road_bottom_sheet/on_road_bottom_sheet.dart';
import '../on_shoulder_bottom_sheet/on_shoulder_bottom_sheet.dart';
import '../weather_hazard_bottom_sheet/weather_hazard_bottom_sheet.dart';

class HazardBottomSheet {
  HazardBottomSheet();
  void show() {
    showModalBottomSheet(
      context: navigatorKeyGlobal.currentContext!,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (context) => const HazardBottomSheetContent(),
    );
  }
}

class HazardBottomSheetContent extends StatefulWidget {
  const HazardBottomSheetContent({Key? key}) : super(key: key);

  @override
  State<HazardBottomSheetContent> createState() =>
      _HazardBottomSheetContentState();
}

class _HazardBottomSheetContentState extends State<HazardBottomSheetContent> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0.r),
            topRight: Radius.circular(30.0.r),
          )),
      child: Stack(children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 28.h,
            ),
            const BottomSheetMainTitleWidget(
              titleImage: AppAssets.hazardSvg,
              imageSize: 110,
              space: 8,
              fontSize: 28,
              title: 'Hazard',
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
                      categoryImage: AppAssets.onroadSvg,
                      imageSize: 54,
                      space: 2,
                      fontSize: 13,
                      isSelected: isSelected,
                      categoryTitle: 'On road',
                      onTap: () {
                        OnRoadBottomSheet().show();
                      }),
                  // VerticalDivider(
                  //   thickness: 1.sp,
                  // ),

                  Container(
                    color: Colors.black12,
                    width: 1,
                    height: double.infinity,
                  ),

                  BottomSheetCategory(
                      categoryImage: AppAssets.shoulderSvg,
                      imageSize: 54,
                      categoryTitle: 'Shoulder',
                      space: 3,
                      isSelected: isSelected,
                      fontSize: 13,
                      onTap: () {
                        OnShoulderBottomSheet().show();
                      }),
                  Container(
                    color: Colors.black12,
                    width: 1,
                    height: double.infinity,
                  ),

                  // VerticalDivider(
                  //   thickness: 1.sp,
                  // ),
                  BottomSheetCategory(
                      categoryImage: AppAssets.weatherSvg,
                      imageSize: 54,
                      categoryTitle: 'Weather ',
                      fontSize: 13,
                      isSelected: isSelected,
                      onTap: () {
                        WeatherHazardBottomSheet().show();
                      }),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 28.0, left: 18.w, bottom: 6.h),
              child: ActionWidget(
                actionTitleImage: AppAssets.cameraSvg,
                imageSize: 50,
                space: 28,
                actionTitle: 'Take Picture',
                fontSize: 14,
                onTap: () async {
                  await getImageFromCamera();
                },
              ),
            ),
            Divider(
              thickness: 1.sp,
            ),
            Padding(
              padding: EdgeInsets.only(top: 6.0.sp, left: 18.sp, bottom: 20.sp),
              child: ActionWidget(
                actionTitleImage: AppAssets.commentSvg,
                imageSize: 46,
                space: 28,
                fontSize: 14,
                actionTitle: 'Add Comments',
                onTap: () {
                  AddCommentBottomSheet().show();
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
        Positioned(
            top: 14.h, right: 4.w, child: const CloseBottomSheetWidget()),
      ]),
    );
  }
}
