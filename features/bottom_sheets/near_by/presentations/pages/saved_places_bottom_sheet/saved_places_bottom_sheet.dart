import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../app/globals.dart';


class SavedPlacesBottomSheet {
  SavedPlacesBottomSheet();
  void show() {
    showModalBottomSheet(
      context: navigatorKeyGlobal.currentContext!,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (context) => const SavedPlacesBottomSheetContent(),
    );
  }
}

class SavedPlacesBottomSheetContent extends StatelessWidget {
  const SavedPlacesBottomSheetContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0.r),
            topRight: Radius.circular(30.0.r),
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(left: 20.w, top: 40.h),
              child: Row(
                children: [
                  GestureDetector(
                    child: Icon(
                      Icons.arrow_back,
                      size: 24.sp,
                    ),
                    onTap: ()=> Navigator.of(context).pop(),

                  ),
                  SizedBox(
                    width: 80.w,
                  ),
                  Text('Saved Places',
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold)),
                ],
              )),




          Padding(
            padding: EdgeInsets.only(left: 30.w, top: 40.h),
            child: Row(
              children: [
                Icon(
                  Icons.watch_later_outlined,
                  size: 22.sp,
                ),
                SizedBox(
                  width: 28.w,
                ),
                Text('Islamabad',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 10.h, bottom: 10.w),
            child: Row(
              children: [
                SizedBox(
                  width: 60.w,
                ),
                Text(
                  'Pwd Police foundation, islamabad',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontSize: 12.sp,
                      ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1.sp,
          ),
          Padding(
            padding: EdgeInsets.only(left: 32.w, top: 20.h),
            child: Row(
              children: [
                Icon(
                  Icons.watch_later_outlined,
                  size: 22.sp,
                ),
                SizedBox(
                  width: 28.w,
                ),
                Text('Gulberg Greens',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold)),
                SizedBox(width: 26.w,),
                SizedBox(height: 20.h,width: 70.w,
                  child: ElevatedButton(
                      onPressed: (){}, child: Text('share',
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: Colors.white,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold))),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 80.w, top: 10.h, bottom: 10.w),
            child: Row(
              children: [
                Text(
                  'App in snap , Gulberg greens, isb',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontSize: 12.sp,
                      ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1.sp,
          ),

          Padding(
            padding: EdgeInsets.only(left: 30.w, top: 20.h),
            child: Row(
              children: [
                Icon(
                  Icons.watch_later_outlined,
                  size: 22.sp,
                ),
                SizedBox(
                  width: 26.w,
                ),
                Text('Chandni chock ',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 80.w, top: 10.h, bottom: 10.w),
            child: Row(
              children: [

                Text(
                  'Clock tower Rawalpindi',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1.sp,
          ),
        ],
      ),
    );
  }
}
