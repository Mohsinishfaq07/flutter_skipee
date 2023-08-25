import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skipee/features/global_widgets/widgets/later_button.dart';


import '../../../../../utils/constants/app_assets.dart';
import 'detail_bottom_sheet.dart';

class DirectionBottomSheetWidget extends StatelessWidget {
  const DirectionBottomSheetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0.r),
            topRight: Radius.circular(30.0.r),
          )),
      height: 300.h,
      child: SingleChildScrollView(

          child: Column(
            children: [
              const Align(
                alignment: Alignment.center,
                child: Icon(Icons.remove,),),
              Container(
                height: 40,
                width: double.infinity,
                color: Colors.grey.shade100,
                child: Row(
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    SvgPicture.asset(AppAssets.dragUpDownSvg),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      '25Km',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade600),
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    Text(
                      'You can reach your destination in 20 mins',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 15.h,
                  left: 30.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //   mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      children: [
                        Icon(
                          Icons.radio_button_checked,
                          color: Colors.red,
                          size: 20.sp,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          'Gulberg  Zindigi Office,  , Islamabad',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 9.w, top: 1.h),
                      child: DottedLine(
                        direction: Axis.vertical,
                        lineLength: 30.h,
                        lineThickness: 2.0,
                        // dashLength: 2.0,
                        dashColor: Colors.black26,
                        dashGapLength: 3.0,
                        dashGapRadius: 250.0,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.radio_button_checked,
                          color: Colors.orange,
                          size: 20.sp,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          'Pwd Police  Foundation,  Islamabad',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 9.w, top: 1.h),
                      child: DottedLine(
                        direction: Axis.vertical,
                        lineLength: 30.h,
                        lineThickness: 2.0,
                        // dashLength: 2.0,
                        dashColor: Colors.black26,
                        dashGapLength: 3.0,
                        dashGapRadius: 250.0,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: Colors.green,
                          size: 16.sp,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          'Pwd Police  Foundation,  Islamabad',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 14.h),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 22.w,vertical: 14.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   const LaterButtonWidget(title: 'Copy link'),
                    SizedBox(
                      height: 42.h,
                      width: 154.w,
                      child: ElevatedButton(
                          onPressed: () {
                        DetailBottomSheet().show();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Share',
                                style: TextStyle(fontSize: 16.sp),
                              ),

                              SvgPicture.asset(
                                AppAssets.locationSvg,
                                color: Colors.white,
                                height: 24  .h,
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}

