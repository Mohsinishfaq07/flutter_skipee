import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BottomSheetMainTitleWidget extends StatelessWidget {
  const BottomSheetMainTitleWidget({
    Key? key,
    this.titleImage,
    required this.title,
    this.fontSize = 28,
    this.imageSize = 36,
    this.space = 0,
  }) : super(key: key);

  final String? titleImage;
  final String title;
  final double fontSize;
  final double imageSize;
  final double space;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Column(
          children: [
            if (titleImage != null)
              SvgPicture.asset(
                titleImage!,
                height: imageSize.sp,
              ),
            SizedBox(
              height: space.w,
            ),
            Transform.translate(
              offset: Offset(0, ((titleImage != null) ? -25 : 0)),
              child: Text(title,
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontSize: fontSize.sp,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ));
  }
}
