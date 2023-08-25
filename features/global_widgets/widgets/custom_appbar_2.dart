import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppbar2 extends StatelessWidget {
  const CustomAppbar2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 34.h, left: 20.w, right: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 28.sp,
                ),
                onTap: () => Navigator.pop(context),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.h),
                child: Text('Recording',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const Text('Done'),
        ],
      ),
    );
  }
}
