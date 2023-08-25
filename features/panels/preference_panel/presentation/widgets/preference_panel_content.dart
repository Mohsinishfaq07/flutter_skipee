import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:skipee/features/panels/preference_panel/presentation/manager/preference_panel_view_model.dart';
import 'package:skipee/features/panels/profile_panel/presentation/pages/profile_panel.dart';
import 'package:skipee/utils/router/app_state.dart';

import '../../../../../app/globals.dart';
import '../../../../../utils/constants/app_assets.dart';
import '../../../../../utils/constants/enums/page_state_enum.dart';
import '../../../../../utils/router/models/page_action.dart';
import '../../../../../utils/router/models/page_config.dart';
import '../../../../home/presentation/manager/home_view_model.dart';
import 'preference_item.dart';
import 'profile_avatar.dart';

class PreferencePanelContent extends StatefulWidget {
  const PreferencePanelContent({Key? key}) : super(key: key);

  @override
  State<PreferencePanelContent> createState() => _PreferencePanelContentState();
}

class _PreferencePanelContentState extends State<PreferencePanelContent> {
  HomeViewModel get _homeViewModel => sl();

  @override
  void initState() {
    context.read<PreferencePanelViewModel>().getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _homeViewModel.panelHeightNotifier.value = 450.h;
        _homeViewModel.panelController.animatePanelToPosition(0);
        _homeViewModel.showPreferencesNotifier.value = false;
        return false;
      },
      child: ValueListenableBuilder<bool>(
        valueListenable:
            context.read<PreferencePanelViewModel>().isProfileLoading,
        builder: (_, value, __) {
          if (value) {
            return Center(
              child: SizedBox(
                width: 40.w,
                height: 40.w,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor),
                ),
              ),
            );
          } else {
            return ListView(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 22.w),
              controller: _homeViewModel.panelScrollController,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(AppAssets.dragUpDownSvg),
                ),
                SizedBox(height: 22.h),
                ProfileAvatar(
                  fullName: context
                      .read<PreferencePanelViewModel>()
                      .accountProvider
                      .profileDetails!
                      .fullName,
                  image: context
                      .read<PreferencePanelViewModel>()
                      .getImageProvider(context),
                ),
                SizedBox(height: 22.h),
                const Divider(
                  height: 1,
                  color: Colors.grey,
                ),
                PreferenceItem(
                  title: 'Profile',
                  iconPath: AppAssets.profileSvg,
                  onTap: () {
                    Navigator.pushNamed(context, ProfilePanel.routeName);
                    _homeViewModel.panelHeightNotifier.value = 600.h;
                  },
                ),
                PreferenceItem(
                    title: 'Microphone',
                    iconPath: AppAssets.microphoneSvg,
                    showSwitch: true,
                    onTap: () {}),
                PreferenceItem(
                    title: 'Notifications',
                    iconPath: AppAssets.notificationsSvg,
                    onTap: () {}),
                PreferenceItem(
                    title: 'Map History',
                    iconPath: AppAssets.historySvg,
                    onTap: () {}),
                PreferenceItem(
                    title: 'Sign Out',
                    iconPath: AppAssets.logoutSvg,
                    onTap: () {
                      AppState appState = GetIt.I.get<AppState>();
                      appState.currentAction = PageAction(
                          state: PageState.replaceAll,
                          page: PageConfigs.signInPageConfig);
                      Navigator.pop(context);
                    }),
              ],
            );
          }
        },
      ),
    );
  }
}
