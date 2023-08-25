import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../../../../app/globals.dart';
import '../../../../../utils/constants/app_assets.dart';
import '../../../../../utils/router/app_state.dart';
import '../../manager/home_view_model.dart';

class ProfileBackButton extends StatelessWidget {
  const ProfileBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleShadow(
      opacity: 0.6,
      color: Colors.black12,
      offset: const Offset(0, 3),
      sigma: 10,
      child: InkWell(
        splashColor: Colors.grey,
        onTap: () async {
          bool? result = await innerNavigatorKey.currentState?.maybePop();
          if (!result!) {
            if (context.read<HomeViewModel>().showPreferencesNotifier.value) {
              context.read<HomeViewModel>().panelHeightNotifier.value = 500.h;
              context
                  .read<HomeViewModel>()
                  .panelController
                  .animatePanelToPosition(0);
            }
            context.read<HomeViewModel>().showPreferencesNotifier.value =
                !context.read<HomeViewModel>().showPreferencesNotifier.value;
            AppState appState = sl();
            appState.moveToBackScreen();
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            //padding: EdgeInsets.only(left: 20.w, top: 20),
            child: SvgPicture.asset(
              AppAssets.backButtonSvg,
              width: 30.w,
              height: 25,
            ),
          ),
        ),
      ),
    );
  }
}
