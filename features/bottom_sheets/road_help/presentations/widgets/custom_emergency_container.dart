import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


class CustomEmergencyContainer extends StatelessWidget {
  const CustomEmergencyContainer({
    Key? key,required this.image1, required this.title,this.image2,
  }) : super(key: key);
  final String image1;
  final String? image2;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 87.h,
      width: 330.w,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.all(
          Radius.circular(6.r),
        ),
      ),
      child: Column(
        children: [


          Padding(
            padding:  const EdgeInsets.symmetric(horizontal: 22,vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                SvgPicture.asset(image1),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text( title,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(
                          color:
                          Theme.of(context).primaryColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold)),
                  const Text('16'),
                ],),
                SvgPicture.asset(image2!),
              ],
            ),
          ),

        ],
      ),
    );
  }
}