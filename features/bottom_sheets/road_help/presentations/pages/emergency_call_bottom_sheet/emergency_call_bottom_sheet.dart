import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../app/globals.dart';
import '../../../../../../utils/constants/app_assets.dart';
import '../../../../../global_widgets/widgets/later_button.dart';
import '../../../../../global_widgets/widgets/send_button_widget.dart';
import '../../widgets/custom_emergency_container.dart';




class EmergencyCallBottomSheet {
  EmergencyCallBottomSheet();
  void show() {
    showModalBottomSheet(
      context: navigatorKeyGlobal.currentContext!,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (context) => const EmergencyCallBottomSheetContent(),
    );
  }
}

class EmergencyCallBottomSheetContent extends StatelessWidget {
  const EmergencyCallBottomSheetContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0.r),
            topRight: Radius.circular(30.0.r),
          )),

      child: Padding(
          padding:
              EdgeInsets.only(left: 12.sp, right: 14.sp, top: 40.sp),
          child: Column(mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  GestureDetector(onTap:(){Navigator.pop(context);},
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 28.sp,
                    ),
                  ),
                  SizedBox(width: 50.w,),
                  Text('Emergency call',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold)),

                ],
              ),
              SizedBox(height: 40.h,),
              const CustomEmergencyContainer(image1: AppAssets.blackCircleSvg, title: 'Fire Brigade',image2: AppAssets.phoneSvg,),
              SizedBox(height: 20.h,),
              const CustomEmergencyContainer(image1: AppAssets.blackCircleSvg, title: 'Fire Brigade',image2: AppAssets.phoneSvg,),
              SizedBox(height: 20.h,),
              const CustomEmergencyContainer(image1: AppAssets.blackCircleSvg, title: 'Fire Brigade',image2: AppAssets.phoneSvg,),
              SizedBox(height: 20.h,),
              const CustomEmergencyContainer(image1: AppAssets.blackCircleSvg, title: 'Fire Brigade',image2: AppAssets.phoneSvg,),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  LaterButtonWidget(
                    title: 'Later',
                  ),
                  SendButtonWidget(
                    title: 'Send',
                  ),
                ],
              ),
              SizedBox(height: 10.h,),
            ],
          )),
    );
  }
}


