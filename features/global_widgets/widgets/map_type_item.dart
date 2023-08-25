import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MapTypeItem extends StatelessWidget {
  const MapTypeItem({required this.name, required this.iconPath, this.onTap, this.isActive = false, Key? key}) : super(key: key);

  final String name;
  final String iconPath;
  final bool isActive;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (isActive) ...[
            Container(
              height: 40.h,
              width: 40.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).colorScheme.secondary, width: 1.5),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: SvgPicture.asset(iconPath, height: 35.h, width: 35.h),
            ),
            SizedBox(height: 8.h),
            Text(name, style: Theme.of(context).textTheme.subtitle1?.copyWith(fontWeight: FontWeight.w700)),
          ] else ...[
            SvgPicture.asset(iconPath, height: 40.h, width: 40.h),
            SizedBox(height: 8.h),
            Text(name, style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Theme.of(context).primaryColor)),
          ]
        ],
      ),
    );
  }
}
