import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PreferenceItem extends StatelessWidget {
  const PreferenceItem({required this.title, required this.iconPath, this.showSwitch = false, this.onTap, Key? key}) : super(key: key);

  final String title;
  final String iconPath;
  final bool showSwitch;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(iconPath),
      title: Text(title, style: Theme.of(context).textTheme.bodyText1),
      trailing: showSwitch
          ? AdvancedSwitch(
              controller: ValueNotifier(true),
              activeColor: Theme.of(context).primaryColor,
              height: 23.h,
            )
          : null,
      onTap: onTap,
    );
  }
}
