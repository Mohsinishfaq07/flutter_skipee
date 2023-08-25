import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:introduction_slider/introduction_slider.dart';
import 'package:provider/provider.dart';
import 'package:skipee/utils/extension/extensions.dart';

import '../../../../utils/constants/app_assets.dart';
import '../../../../utils/constants/enums/page_state_enum.dart';
import '../../../../utils/router/app_state.dart';
import '../../../../utils/router/models/page_action.dart';
import '../../../../utils/router/models/page_config.dart';
import '../manager/splash_view_model.dart';

class IntroductionScreenContent extends StatefulWidget {
  const IntroductionScreenContent({Key? key}) : super(key: key);

  @override
  State<IntroductionScreenContent> createState() => _IntroductionScreenContentState();
}

class _IntroductionScreenContentState extends State<IntroductionScreenContent> {
  @override
  void initState() {
    context.read<SplashViewModel>().onErrorMessage = (value) => context.show(message: value);
    context.read<SplashViewModel>().getSessionUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.w),
        child:IntroductionSlider  (
          onDone: Container(),
          done: TextButton(onPressed: (){
            AppState appState = GetIt.I.get<AppState>();
            appState.currentAction = PageAction(state: PageState.replace, page: PageConfigs.homePageConfig);
          },
              child: const Text('Done')),
          items:[
            IntroductionSliderItem(
              image: SvgPicture.asset(AppAssets.splash1Svg),
              // image: SvgPicture.asset(AppAssets.splash1Svg),
              title: 'Find your Way',
              description: 'find the best possible route '
                  'to your destination',
            ),
            IntroductionSliderItem(
              image: SvgPicture.asset(AppAssets.avoidobstacleSvg),
              title: 'avoid obstacles',
              description: 'avoid being late to your work spaces',
            ),
            IntroductionSliderItem(
              image: SvgPicture.asset(AppAssets.splash2Svg),
              title: 'Avoid being late to your ',
              description: 'Get Heads-up about mother nature and sneak pass it ',
            ),

          ],
        ),
        // Column(
        //   children: [
        //     SizedBox(height: 30.h,),
        //     // const Spacer(),
        //     SvgPicture.asset(AppAssets.logoSvg),
        //     SizedBox(height: 30.h,),
        //     // const Spacer(),
        //     SvgPicture.asset(AppAssets.splash1Svg),
        //     SizedBox(height: 30.h,),
        //     Text('Find your way ' ,style: Theme.of(context).textTheme.subtitle2?.copyWith(
        //         fontWeight: FontWeight.bold,
        //         fontSize: 24.sp,
        //         color: Colors.black),),
        //     SizedBox(height: 15.h,),
        //     Text('Find the best possible route  ',style: Theme.of(context).textTheme.subtitle2?.copyWith(
        //         fontWeight: FontWeight.bold,
        //         fontSize: 15.sp,
        //
        //         color: Colors.grey),),
        //     Text('To your destination ',style: Theme.of(context).textTheme.subtitle2?.copyWith(
        //         fontWeight: FontWeight.bold,
        //         fontSize: 15.sp,
        //         color: Colors.grey),),
        //        const LinearProgressIndicator(minHeight: 2),
        //
        //   ],
        // ),
      ),
    );
  }
}
