import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActionWidget extends StatelessWidget {
  const ActionWidget({
    Key? key,
    required this.actionTitleImage,
    required this.actionTitle,
    this.onTap,
    this.imageSize = 36,
    this.space = 10,
    this.fontSize = 12,
  }) : super(key: key);

  final String actionTitleImage;
  final String actionTitle;
  final double imageSize;
  final double fontSize;
  final double space;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.w, top: 1.h),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 70,
              child: SvgPicture.asset(
                actionTitleImage,
                height: imageSize.sp,
              ),
            ),
            SizedBox(
              width: space.w,
            ),
            Text(actionTitle,
                style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: fontSize.sp,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
