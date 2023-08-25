import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../../utils/constants/app_assets.dart';
import '../../../utils/router/app_state.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
        toolbarHeight: 70.h,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            AppState appState = GetIt.I.get<AppState>();
            appState.moveToBackScreen();
          },
          child: Padding(
            padding: EdgeInsets.only(top: 15.0.h, left: 15.w, bottom: 10.h),
            child: SimpleShadow(
              child: Container(
                width: 44.w,
                height: 40.h,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                  size: 18.sp,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(fontSize: 16.h, color: Colors.black),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 22.w),
            child: SvgPicture.asset(AppAssets.logoSvg, height: 22.h),
          ),
        ]);
  }
}