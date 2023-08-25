import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BottomSheetCategory extends StatelessWidget {
  const BottomSheetCategory(
      {Key? key,
      required this.categoryImage,
      required this.categoryTitle,
      this.imageSize = 36,
      this.fontSize = 10,
      this.space = 0,
      this.isSelected = false,
      required this.onTap})
      : super(key: key);
  final String? categoryImage;
  final String? categoryTitle;
  final Function onTap;
  final double imageSize;
  final double fontSize;
  final double space;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        highlightColor: Colors.red,
        onTap: () {
          onTap();
        },
        child: Ink(
          width: 116,
          child: Container(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                SvgPicture.asset(
                  categoryImage!,
                  height: imageSize.w,
                ),
                SizedBox(
                  height: space.w,
                ),
                Text(categoryTitle!,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontSize: fontSize.sp,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
