import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skipee/app/globals.dart';
import '../../../../../../utils/constants/app_assets.dart';
import '../../../../../global_widgets/widgets/bottom_sheet_main_title.dart';
import '../../../../../global_widgets/widgets/category_widget.dart';
import '../../../../../global_widgets/widgets/custom_close_bottom_sheet_widget.dart';
import '../../../../../global_widgets/widgets/custom_search_text_form_field.dart';
import '../../../../../global_widgets/widgets/later_button.dart';
import '../../../../../global_widgets/widgets/send_button_widget.dart';




class AddPlaceBottomSheet {
  AddPlaceBottomSheet();
  void show() {
    showModalBottomSheet(
      context: navigatorKeyGlobal.currentContext!,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (context) => const AddPlaceBottomSheetContent(),
    );
  }
}

class AddPlaceBottomSheetContent extends StatelessWidget {
  const AddPlaceBottomSheetContent({Key? key}) : super(key: key);

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 6.w, top: 26.h),
            child: const Align(
              alignment: Alignment.topRight,
              child: CloseBottomSheetWidget(),
            ),
          ),
          const Center(
            child: BottomSheetMainTitleWidget(
              titleImage: AppAssets.place,
              imageSize: 90,
              space: 30,
              title: 'Add Place',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.w, bottom: 10.h),
            child: Text('Select Category ',
                style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold)),
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BottomSheetCategory(
                  categoryImage: AppAssets.hotelSvg,
                  categoryTitle: 'Hotel',
                  space: 4,
                  fontSize: 14,
                  imageSize: 54,
                  onTap: () {},
                ),
                Container(
                  color: Colors.black12,
                  width: 1,
                  height: double.infinity,
                ),
                BottomSheetCategory(
                  categoryImage: AppAssets.officeSvg,
                  categoryTitle: 'Office',
                  imageSize: 58,
                  fontSize: 14,
                  onTap: () {},
                ),
                Container(
                  color: Colors.black12,
                  width: 1,
                  height: double.infinity,
                ),
                BottomSheetCategory(
                  categoryImage: AppAssets.resturentrSvg,
                  imageSize: 52,
                  fontSize: 14,
                  space: 3,
                  categoryTitle: 'Resturant ',
                  onTap: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.w, top: 20),
            child: Text('Name of places ',
                style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 16),
            child: const CustomSearchTextFormField(
              hintText: '',
              labelText: ('Search Nearby'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const LaterButtonWidget(
                title: 'save',
              ),
              SendButtonWidget(
                title: 'Share',
                ontap: () {},
              ),
            ],
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
