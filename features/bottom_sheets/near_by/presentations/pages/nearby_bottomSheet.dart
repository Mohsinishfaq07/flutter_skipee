import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skipee/features/bottom_sheets/near_by/presentations/pages/saved_places_bottom_sheet/saved_places_bottom_sheet.dart';
import '../../../../../app/globals.dart';
import '../../../../../utils/File Picker/image_picker.dart';
import '../../../../global_widgets/widgets/action_bar_widget.dart';
import '../../../../global_widgets/widgets/bottom_sheet_main_title.dart';
import '../../../../global_widgets/widgets/custom_close_bottom_sheet_widget.dart';
import '../../../../global_widgets/widgets/later_button.dart';
import '../../../../global_widgets/widgets/send_button_widget.dart';
import 'add_place_bottom_sheet/add_place_bottom_sheet.dart';
import 'direction_bottom_sheet.dart';
import '../../../../../../utils/constants/app_assets.dart';



class NearByBottomSheet {
  NearByBottomSheet();
  void show() {
    showModalBottomSheet(
      context: navigatorKeyGlobal.currentContext!,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (context) => const NearByBottomSheetContent(),
    );
  }
}



class NearByBottomSheetContent extends StatelessWidget {
  const   NearByBottomSheetContent({Key? key}) : super(key: key);

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
            titleImage: AppAssets.nearBySvg,
            imageSize: 90,
            space: 30,
            title: 'Nearby',
          ),
          Padding(
            padding: EdgeInsets.only(top: 28.0, left: 18.w,bottom: 6.h),
            child: ActionWidget(
              actionTitleImage: AppAssets.cameraSvg,
              imageSize: 50,
              space: 28,
              actionTitle: 'Take Picture',
              fontSize: 14,
              onTap:()async{
                await getImageFromCamera();
              },
            ),
          ),
          Divider(
            thickness: 1.sp,
          ),
          Padding(
            padding: EdgeInsets.only(top: 6.0.sp, left: 18.sp,bottom: 20.sp),
            child: ActionWidget(
              actionTitleImage: AppAssets.place,
              imageSize: 46,
              space: 28,
              fontSize: 14,
              actionTitle: 'Add a place ',
              onTap: () {
                AddPlaceBottomSheet().show();
              },
            ),
          ),  Divider(
            thickness: 1.sp,
          ),
          Padding(
            padding: EdgeInsets.only(top: 6.0.sp, left: 18.sp,bottom: 20.sp),
            child: ActionWidget(
              actionTitleImage: AppAssets.star,
              imageSize: 46,
              space: 28,
              fontSize: 14,
              actionTitle: 'Saved Places',
              onTap: () {
                SavedPlacesBottomSheet().show();
              },
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:  [
              const LaterButtonWidget(
                title: 'Later',
              ),
              SendButtonWidget(
                title: 'Send',
                ontap: () {
                  showModalBottomSheet<void>(
                      isScrollControlled: true,
                      context: navigatorKeyGlobal.currentContext!,
                      builder: (BuildContext context) {
                        return  const DirectionBottomSheetWidget();
                      });
                },

              ),
            ],
          ),
          SizedBox(height: 10.h,),
        ],
      ),
    );
  }
}
