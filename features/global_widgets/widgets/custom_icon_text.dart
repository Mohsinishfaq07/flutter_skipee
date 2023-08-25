import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIconText extends StatelessWidget {
  const CustomIconText({
    Key? key,required this.icon, required this.title,
  }) : super(key: key);
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 20.w),
      child: SingleChildScrollView(
        child: Row(
          children: [
            Icon(icon,size: 22.h,),
            SizedBox(
              width: 30.w,
            ),

            Text(
              title, style: Theme.of(context).textTheme.subtitle2?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
                color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}