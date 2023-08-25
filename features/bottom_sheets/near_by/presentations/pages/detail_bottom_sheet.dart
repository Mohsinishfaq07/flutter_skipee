import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:skipee/app/globals.dart';

import '../../../../global_widgets/widgets/custom_icon_text.dart';


class DetailBottomSheet {
  DetailBottomSheet();
  void show() {
    showModalBottomSheet(
      context: navigatorKeyGlobal.currentContext!,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (context) => const DetailBottomSheetContent(),
    );
  }
}



class DetailBottomSheetContent extends StatelessWidget {
   const DetailBottomSheetContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0.r),
            topRight: Radius.circular(30.0.r),
          )),
      height: 760.h,
      child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
              padding: EdgeInsets.only(top: 22.h,left: 18),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Row(children: [
                Text('28 min', style: Theme.of(context).textTheme.subtitle2?.copyWith(
                    fontWeight: FontWeight.normal,
                    fontSize: 20.sp,
                    color: Colors.green),),
                SizedBox(width: 8.w,),
                Text('(23 Km) ', style: Theme.of(context).textTheme.subtitle2?.copyWith(
                    fontSize: 20.sp,
                    color: Colors.grey),),],),
              SizedBox(height: 6.h,),
          Text('Fastest route,the usual traffic ', style: Theme.of(context).textTheme.subtitle2?.copyWith(
                fontWeight: FontWeight.normal,
                fontSize: 16.sp,
                color: Colors.grey),),
              ],
          ),
            ),
             const  Divider(),
                           Padding(
                             padding:  EdgeInsets.only(left: 20.w,top: 30.h,right: 20.w),
                             child:Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [Text(' Traffic ', style: Theme.of(context).textTheme.subtitle2?.copyWith(
                                 fontWeight: FontWeight.bold,
                                 fontSize: 16.sp,
                                 color: Colors.black54),),
                                 SizedBox(height:20.h,),

                                 Row(children: [
                                   const Expanded(child:
                                   DottedLine(dashColor: Colors.black12,)),
                                   Text('45 min', style: Theme.of(context).textTheme.subtitle2?.copyWith(
                                     fontWeight: FontWeight.bold,
                                     fontSize: 10.sp,
                                     color: Colors.black26),),],),
                                 SizedBox(height:10.h,),
                                 Container(height: 60.h,
                                   width: double.infinity,
                                   color: Colors.pink,
                                   child: Text('This is bar chart', style: Theme.of(context).textTheme.subtitle2?.copyWith(
                                       fontWeight: FontWeight.normal,
                                       fontSize: 14.sp,
                                       color: Colors.grey),),),
                                 SizedBox(height:10.h,),],),

                           ),
    const Divider(),
    Padding(
      padding:  EdgeInsets.only(left: 20.w,right: 20.w,top: 20.h),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [

          Text(' Steps ', style: Theme.of(context).textTheme.subtitle2?.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 16.sp,
          color: Colors.black54),),
              SizedBox(
                height: 30.h,
              ),
              const CustomIconText(icon: Icons.radio_button_checked, title: 'Your location',),
          Padding(
              padding:  EdgeInsets.only(left: 60.w,top: 20.h),
              child: Column(children: const [  Divider(
              ),
              ],
              ),
          ),
          SizedBox(
            height: 20.w,
          ),
        const CustomIconText(icon: Icons.arrow_upward_rounded, title: 'Head southwest',),
        Padding(
            padding:  EdgeInsets.only(left: 80.w,top: 20.h),
            child: Row(

              children:  [Text(' 60 m ', style: Theme.of(context).textTheme.subtitle2?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                  color: Colors.grey),),
                const Expanded(
                child: Divider(
            ),
              ),],)
        ),
          SizedBox(height: 18.h,),
          const CustomIconText(icon: Icons.turn_left_outlined, title: 'Turn left  toward park Ave',),
          Padding(
              padding:  EdgeInsets.only(left: 80.w,top: 18.h),
              child: Row(

                children:  [Text(' 60 m ', style: Theme.of(context).textTheme.subtitle2?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                    color: Colors.grey),), const Expanded(
                  child: Divider(
                  ),
                ),],)

          ),
          SizedBox(height: 18.h,),
          const CustomIconText(icon: Icons.turn_slight_left, title: 'Slight left onto Park Ave',),
          Padding(
              padding:  EdgeInsets.only(left: 80.w,top: 18.h),
              child: Row(
                children:  [Text(' 550 m ', style: Theme.of(context).textTheme.subtitle2?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                    color: Colors.grey),), const Expanded(
                  child: Divider(
                  ),
                ),],)

          ),
          SizedBox(height: 18.h,),
          const CustomIconText(icon: Icons.roundabout_left  , title: 'At the roundabout, take the 2nd exit ',),
          Padding(
            padding:  EdgeInsets.only(left: 70.w),
            child: Text('and stay on Park Ave ', style: Theme.of(context).textTheme.subtitle2?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
                color: Colors.black54),),
          ),


   ],)
    ),
    ]
   ),
      ),
      );
  }
}



