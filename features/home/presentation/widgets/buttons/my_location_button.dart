import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:skipee/features/home/presentation/manager/home_view_model.dart';

import '../../../../../utils/constants/app_assets.dart';

class MyLocationButton extends StatelessWidget {
  const MyLocationButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 22.w,
      bottom: 75.h,
      child: ValueListenableBuilder<bool>(
        valueListenable: context.read<HomeViewModel>().showControlButtonNotifier,
        builder: (_, value, __) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: !value ? _buildButton(context) : const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return SimpleShadow(
      opacity: 0.6,
      color: Colors.black12,
      offset: const Offset(0, 3),
      sigma: 10,
      child: InkWell(
        splashColor: Colors.grey,
        onTap: context.read<HomeViewModel>().moveToCurrentLocation,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(10.w),
          child: SvgPicture.asset(AppAssets.myLocSvg),
        ),
      ),
    );
  }
}
