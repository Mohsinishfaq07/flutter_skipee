import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomSpeedLimitWidget extends StatelessWidget {
  const CustomSpeedLimitWidget({
    Key? key,
    required this.titleImage,
    this.imageSize = 36,
    this.title,
    this.title2,
    this.space = 2,
    this.fontSize = 12,
  }) : super(key: key);

  final String titleImage;
  final String? title;
  final String? title2;
  final double imageSize;
  final double fontSize;
  final double space;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: Row(
        children: [
          SvgPicture.asset(
            titleImage,
            height: imageSize.sp,
          ),
          SizedBox(
            width: space.w,
          ),
          RichText(
            text: TextSpan(
                text: title,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize.sp,
                ),
                children: [
                  TextSpan(
                    text: title2,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
