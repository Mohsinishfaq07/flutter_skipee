import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../app/globals.dart';
import '../../../../../utils/constants/app_theme.dart';
import '../../../../home/presentation/manager/home_view_model.dart';

import '../../../menu_panel/presentation/pages/menu_panel.dart';

import '../../../preference_panel/presentation/pages/preference_panel.dart';
import '../../../profile_panel/presentation/pages/profile_panel.dart';
import '../../../security_panel/presentation/pages/security_panel.dart';

class MainPanel extends StatefulWidget {
  const MainPanel({Key? key}) : super(key: key);

  @override
  State<MainPanel> createState() => _MainPanelState();
}

class _MainPanelState extends State<MainPanel> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25.r),
        topRight: Radius.circular(25.r),
      ),
      child: MaterialApp(
        title: 'Skipee',
        navigatorKey: innerNavigatorKey,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.appTheme,
        routes: {
          MenuPanel.routeName: (context) => const MenuPanel(),

          PreferencePanel.routeName: (context) => const PreferencePanel(),
          ProfilePanel.routeName: (context) => const ProfilePanel(),
          SecurityPanel.routeName: (context) => const SecurityPanel(),

        },
        home: ValueListenableBuilder<bool>(
          valueListenable:
              context.read<HomeViewModel>().showPreferencesNotifier,
          builder: (_, value, __) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: value ? const PreferencePanel() : const MenuPanel(),
            );
          },
        ),
      ),
    );
  }
}
