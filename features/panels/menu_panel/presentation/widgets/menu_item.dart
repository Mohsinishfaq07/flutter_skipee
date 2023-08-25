import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuItemWidget extends StatelessWidget {
  const MenuItemWidget(
      {required this.name, required this.iconPath,this.imageSize= 36, this.fontSize= 14, this.imageScale=1, this.space=0,this.onTap, Key? key})
      : super(key: key);

  final String name;
  final String iconPath;
  final Function()? onTap;
  final double imageSize;
  final double space;
  final double fontSize;
  final double imageScale;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Transform.scale(
            scale: imageScale,
            child: SvgPicture.asset(
              iconPath,
              height: imageSize.sp,
            ),
          ),
          SizedBox(height: space.w),
          Text(name,
              style: Theme.of(context).textTheme.titleSmall ?.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontSize: fontSize.sp,
                  fontWeight: FontWeight.bold)),

        ],
      ),
    );
  }
}
