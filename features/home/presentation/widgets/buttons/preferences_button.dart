import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../../../../utils/constants/app_assets.dart';
import '../../manager/home_view_model.dart';

class PreferencesButton extends StatelessWidget {
  const PreferencesButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleShadow(
      opacity: 0.6,
      color: Colors.black12,
      offset: const Offset(0, 3),
      sigma: 10,
      child: InkWell(
        splashColor: Colors.grey,
        onTap: context.read<HomeViewModel>().onPreferenceButtonClick,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(8.w),
          child: SvgPicture.asset(AppAssets.preferencesSvg, width: 18.w),
        ),
      ),
    );
  }
}
