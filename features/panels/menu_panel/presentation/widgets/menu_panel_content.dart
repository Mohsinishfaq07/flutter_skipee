import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:skipee/features/panels/menu_panel/presentation/widgets/menu_item.dart';

import '../../../../../utils/constants/app_assets.dart';
import '../../../../bottom_sheets/accident/presentations/pages/accident_bottom_sheet.dart';
import '../../../../bottom_sheets/fuel_prices/presentations/pages/fuel_prices_bottom_sheet.dart';
import '../../../../bottom_sheets/hazard/presentations/pages/hazard_bottom_sheet/hazard_bottom_sheet.dart';
import '../../../../bottom_sheets/map_issue/presentations/pages/map_issue_bottom_sheet.dart';
import '../../../../bottom_sheets/near_by/presentations/pages/nearby_bottomSheet.dart';
import '../../../../bottom_sheets/road_help/presentations/pages/road_help_bottom_sheet.dart';
import '../../../../bottom_sheets/s_camera/presentations/pages/s_camera_bottom_sheet.dart';
import '../../../../bottom_sheets/t_congestion/presentations/pages/t.congestion_bottom_sheet.dart';
import '../../../../bottom_sheets/v_note/presentations/pages/v.note_bottom_sheet.dart';

class MenuPanelContent extends StatelessWidget {
  const MenuPanelContent({Key? key}) : super(key: key);
  // HomeViewModel get _homeViewModel => sl();
  @override
  Widget build(BuildContext context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 8.0.h),
            child: SvgPicture.asset(AppAssets.dragUpDownSvg),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            height: 360,
            color: Colors.grey.shade300,
            child: Padding(
              padding: EdgeInsets.only(top: 2.sp),
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                primary: false,
                crossAxisCount: 3,
                childAspectRatio: (1 / .8),
                padding: EdgeInsets.zero,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 18),
                    child: MenuItemWidget(
                      name: 'Hazard',
                      imageScale: 1.5,
                      fontSize: 13,
                      iconPath: AppAssets.hazardSvg,
                      onTap: () {
                        HazardBottomSheet().show();
                      },
                    ),
                    color: Colors.white,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 18),
                    child: Center(
                      child: MenuItemWidget(
                        name: 'Picket',
                        fontSize: 13,
                        iconPath: AppAssets.petrolPumpSvg,
                        imageScale: 1.4,
                        onTap: () {},
                      ),
                    ),
                    color: Colors.white,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 18),
                    child: Center(
                      child: MenuItemWidget(
                          name: 'Near bY',
                          fontSize: 13,
                          imageScale: 1.2,
                          space: 2,
                          iconPath: AppAssets.nearBySvg,
                          onTap: () {
                            NearByBottomSheet().show();
                          }),
                    ),
                    color: Colors.white,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 18),
                    child: Center(
                        child: MenuItemWidget(
                            name: 'Accident',
                            fontSize: 13,
                            iconPath: AppAssets.accidentMainSvg,
                            onTap: () {
                              AccidentBottomSheet().show();
                            })),
                    color: Colors.white,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 18),
                    child: Center(
                      child: MenuItemWidget(
                          name: 'Road Help',
                          fontSize: 13,
                          iconPath: AppAssets.roadhelpSvg,
                          imageScale: 1.2,
                          space: 4,
                          onTap: () {
                            RoadHelpBottomSheet().show();
                          }),
                    ),
                    color: Colors.white,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 18),
                    child: Center(
                      child: MenuItemWidget(
                          name: 'Route',
                          fontSize: 13,
                          iconPath: AppAssets.routeaSvg,
                          onTap: () {}),
                    ),
                    color: Colors.white,
                  ),
                  Container(
                    height: 5.h,
                    width: 700.w,
                    padding: const EdgeInsets.only(top: 18),
                    child: Center(
                      child: MenuItemWidget(
                          name: 'T.Congestion',
                          fontSize: 13,
                          iconPath: AppAssets.tcongestionSvg,
                          onTap: () {
                            TCongestionBottomSheet().show();
                          }),
                    ),
                    color: Colors.white,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 18),
                    child: Center(
                      child: MenuItemWidget(
                          name: 'S. Camera',
                          imageScale: 1.3,
                          fontSize: 13,
                          iconPath: AppAssets.cameraSvg,
                          onTap: () {
                            SCameraBottomSheet().show();
                          }),
                    ),
                    color: Colors.white,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 18),
                    child: Center(
                      child: MenuItemWidget(
                          name: 'V. Note',
                          fontSize: 13,
                          imageSize: 44,
                          iconPath: AppAssets.micSvg,
                          onTap: () {
                            VoiceNoteBottomSheet().show();
                          }),
                    ),
                    color: Colors.white,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 18),
                    child: Center(
                      child: MenuItemWidget(
                          name: 'Map Issue',
                          fontSize: 13,
                          iconPath: AppAssets.mapIssueSvg,
                          onTap: () {
                            MapIssueBottomSheet().show();
                          }),
                    ),
                    color: Colors.white,
                  ),
                  Container(
                    padding:  EdgeInsets.only(top: 18.h),
                    child: Center(
                        child: MenuItemWidget(
                            name: 'Fuel Prices',
                            fontSize: 13,
                            iconPath: AppAssets.prtrolSvg,
                            onTap: () {
                              FuelPricesBottomSheet().show();
                            })),
                    color: Colors.white,
                  ),
                  Container(
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    // );
  }
}
