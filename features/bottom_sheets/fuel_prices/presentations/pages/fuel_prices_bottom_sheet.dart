import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skipee/app/globals.dart';

import '../../../../../utils/constants/app_assets.dart';
import '../../../../global_widgets/widgets/bottom_sheet_main_title.dart';
import '../../../../global_widgets/widgets/category_widget.dart';
import '../../../../global_widgets/widgets/custom_close_bottom_sheet_widget.dart';
import '../../../../global_widgets/widgets/send_button_widget.dart';


class FuelPricesBottomSheet {
  FuelPricesBottomSheet();
  void show() {
    showModalBottomSheet(
      context: navigatorKeyGlobal.currentContext!,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (context) => const FuelPricesBottomSheetContent(),
    );
  }
}

class FuelPricesBottomSheetContent extends StatelessWidget {
  const FuelPricesBottomSheetContent({Key? key}) : super(key: key);

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
            titleImage: AppAssets.fuelPrisesSvg,
            imageSize: 68,
            space: 30,
            title: 'Fuel Prices',
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.sp, bottom: 10.sp),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Select Vehicle',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontSize: 22.sp,
                      )),
            ),
          ),
          Container(
            width: 400.w,
            height: 124.h,
            padding: const EdgeInsets.symmetric(horizontal: 42),
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
                BottomSheetCategory(
                  categoryImage: AppAssets.privatecarSvg,
                  imageSize: 52,
                  space: 8,
                  fontSize: 14,
                  categoryTitle: 'Private Car',
                  onTap: () {},
                ),
                VerticalDivider(
                  thickness: 1.sp,
                ),
                BottomSheetCategory(
                  categoryImage: AppAssets.taxicarSvg,
                  imageSize: 58,
                  space: 8,
                  fontSize: 14,
                  categoryTitle: 'Taxi Car',
                  onTap: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.sp, top: 6, bottom: 6.sp),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Fuel Type',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontSize: 22.sp)),
            ),
          ),
          SizedBox(
            height: 124.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BottomSheetCategory(
                  categoryImage: AppAssets.petrolSvg,
                  categoryTitle: 'Petrol',
                  imageSize: 42,
                  space: 16,
                  fontSize: 14,
                  onTap: () {},
                ),
                SizedBox(
                  width: 30.w,
                ),
                VerticalDivider(
                  thickness: 1.sp,
                ),
                SizedBox(
                  width: 10.w,
                ),
                BottomSheetCategory(
                  categoryImage: AppAssets.petrolSvg,
                  categoryTitle: 'Diesel',
                  imageSize: 42,
                  fontSize: 14,
                  space: 16,
                  onTap: () {},
                ),
              ],
            ),
          ),

          Padding(
            padding:  EdgeInsets.only(top: 18.0.h,bottom: 10.h),
            child: const SendButtonWidget(
              title: 'Save',
            ),
          ),

        ],
      ),
    );
  }
}
