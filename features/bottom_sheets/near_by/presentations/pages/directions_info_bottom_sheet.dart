import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skipee/features/global_widgets/widgets/later_button.dart';
import 'package:skipee/features/global_widgets/widgets/send_button_widget.dart';
import 'package:skipee/utils/constants/app_assets.dart';

import '../../../../../app/globals.dart';



class DirectionsInfoBottomSheet {
  DirectionsInfoBottomSheet();

  void show() {
    showModalBottomSheet(
      context: navigatorKeyGlobal.currentContext!,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (context) => _DirectionsInfoBottomSheetContent(),
    );
  }
}

class _DirectionsInfoBottomSheetContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: Transform.translate(
                  offset: const Offset(0, -30),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(185, 46, 51, 1),
                      borderRadius: BorderRadius.circular(500),
                    ),
                    child: SvgPicture.asset(
                      AppAssets.locationIconRedSvg,
                      height: 50,
                      width: 50,
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Column(
                      children: [
                        Text(
                          'Police Foundation 0-9 Housing Scheme Office',
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Main PWD Road. Islamabad, Punjab',
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '97 km away',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      ],
                    ),
                  ),
                  const Divider(thickness: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppAssets.metroPhoneSvg),
                      Text(
                        '03859631586',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Expanded(child: LaterButtonWidget(title: 'Later')),
                        SizedBox(width: 10),
                        Expanded(child: SendButtonWidget(title: 'Go'))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
