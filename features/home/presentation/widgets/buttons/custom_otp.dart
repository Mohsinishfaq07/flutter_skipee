import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomOtpFields extends StatelessWidget {
  const CustomOtpFields(
      {this.controller,
      this.errorStream,
      this.onCompleted,
      required this.onChanged,
      this.beforeTextPaste,
      Key? key})
      : super(key: key);
  final TextEditingController? controller;
  final StreamController<ErrorAnimationType>? errorStream;
  final Function(String)? onCompleted;
  final Function(String) onChanged;
  final bool Function(String?)? beforeTextPaste;
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      mainAxisAlignment: MainAxisAlignment.center,
      cursorHeight: 14.sp,
      appContext: context,
      pastedTextStyle: const TextStyle(
        // color: Theme.of(context).primaryColor,
        fontWeight: FontWeight.bold,
      ),
      length: 6,
      backgroundColor: Colors.transparent,
      obscureText: false,
      obscuringCharacter: '*',
      animationType: AnimationType.slide,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.circle,
        // borderRadius: BorderRadius.circular(70.r),
        fieldHeight: 35.w,
        fieldWidth: 35.w,
        borderWidth: 1.w,
        fieldOuterPadding: const EdgeInsets.all(3),
        activeFillColor: Colors.blueGrey.withOpacity(0.1),
        activeColor: Colors.blueGrey.withOpacity(0.1),
        inactiveFillColor: Colors.blueGrey.withOpacity(0.1),
        inactiveColor: Colors.blueGrey.withOpacity(0.1),
        errorBorderColor: Colors.redAccent,
        selectedFillColor: Colors.blueGrey.withOpacity(0.1),
        selectedColor: Colors.blueGrey.withOpacity(0.1),
      ),
      cursorColor: Colors.black,
      animationDuration: const Duration(milliseconds: 300),
      textStyle: TextStyle(fontSize: 16.sp, height: 1.8.h),
      enableActiveFill: true,
      errorAnimationController: errorStream,
      controller: controller,
      keyboardType: TextInputType.number,
      autoDisposeControllers: true,
      boxShadows: const [
        BoxShadow(
          offset: Offset(0, 2),
          color: Colors.white,
          blurRadius: 10,
        )
      ],
      onCompleted: onCompleted,
      onChanged: onChanged,
      beforeTextPaste: beforeTextPaste,
    );
  }
}
