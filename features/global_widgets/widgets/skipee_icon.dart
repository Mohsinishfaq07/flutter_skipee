import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../../../utils/constants/app_assets.dart';

class SkipeeIcon extends StatelessWidget {
  const SkipeeIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleShadow(
      opacity: 0.6,
      color: Colors.black12,
      sigma: 5,
      child: SvgPicture.asset(AppAssets.logoSvg, width: 100.w,height: 34.h,),
    );
  }
}
