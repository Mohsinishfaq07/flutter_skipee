import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../global_widgets/bottom_sheets/add_comment_bottom_sheet.dart';
import '../../../../global_widgets/widgets/action_bar_widget.dart';
import '../../../../global_widgets/widgets/bottom_sheet_main_title.dart';
import '../../../../global_widgets/widgets/category_widget.dart';
import '../../../../global_widgets/widgets/custom_close_bottom_sheet_widget.dart';
import '../../../../global_widgets/widgets/later_button.dart';
import '../../../../global_widgets/widgets/send_button_widget.dart';
import 'map_issue_details_bottom_sheet.dart';
import 'package:skipee/app/globals.dart';
import '../../../../../../utils/constants/app_assets.dart';



class MapIssueBottomSheet {
  MapIssueBottomSheet();
  void show() {
    showModalBottomSheet(
      context: navigatorKeyGlobal.currentContext!,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (context) => const MapIssueBottomSheetContent(),
    );
  }
}
class MapIssueBottomSheetContent extends StatefulWidget {
  const MapIssueBottomSheetContent({Key? key}) : super(key: key);

  @override
  State<MapIssueBottomSheetContent> createState() =>
      _MapIssueBottomSheetContentState();
}

class _MapIssueBottomSheetContentState
    extends State<MapIssueBottomSheetContent> {
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


      child:
      Column(mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10.w, top: 36.h),
            child: const Align(
              alignment: Alignment.topRight,
              child: CloseBottomSheetWidget(),
            ),
          ),
          const BottomSheetMainTitleWidget(
            titleImage: AppAssets.mapIssueSvg,
            imageSize: 72,
            space: 30,
            title: 'Map Issue',
          ),
          Container(
            width: 400.w,
            height: 124.h,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey),
                bottom: BorderSide(color: Colors.grey),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: BottomSheetCategory(
                    categoryImage: AppAssets.mapIssueSvg,
                    categoryTitle: 'Map issue',
                    fontSize: 14,
                    space: 6,
                    isSelected: !isSelected,
                    imageSize: 50,
                    onTap: () {
                      MapIssueDetailsBottomSheet().show();
                    },
                  ),
                ),

                Container(
                  color: Colors.black12,
                  width: 2,
                  height: double.infinity,
                ),

                Expanded(
                  child: BottomSheetCategory(
                    categoryImage: AppAssets.paveSvg,
                    categoryTitle: 'Pave',
                    fontSize: 15,
                    imageSize: 46,
                    isSelected: isSelected,
                    space:  6,
                    onTap: () {
                      setState(() {
                        isSelected = !isSelected;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              layoutBuilder: (currentChild, previousChildren) => isSelected
                  ? Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 50.sp, vertical: 10.sp),
                child: Column(children: [
                  const Text(
                    'To add an empty road simply tap on pave button and',
                    textAlign: TextAlign.center,
                  ),
                  const Text('start driving.remember to stop when done.',
                      textAlign: TextAlign.center),
                  SizedBox(
                    height: 10.h,
                  ),
                  const SendButtonWidget(title: 'Pave')
                ]),
              )
                  : Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 16.h, bottom: 24.h),
                        child: ActionWidget(
                          actionTitleImage: AppAssets.commentSvg,
                          imageSize: 46,
                          actionTitle: 'Add comments',
                          fontSize: 14,
                          onTap: () => AddCommentBottomSheet().show(),
                        ),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
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
                  )
          ),
        ],
      )

    );
  }
}
