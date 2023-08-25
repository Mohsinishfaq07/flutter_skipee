import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/constants/app_assets.dart';

class CloseBottomSheetWidget extends StatelessWidget {
   const CloseBottomSheetWidget({
    Key? key,
  }) : super(key: key);
  // bool isSelected = true;

  @override
  Widget build(BuildContext context) {




    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Padding(
        padding:  EdgeInsets.only(right: 22.w,top: 5.h),
        child:
        SvgPicture.asset(
        AppAssets.crossSvg,
        height: 26.h,
        )

      ,
      ),
    );
  }
}
