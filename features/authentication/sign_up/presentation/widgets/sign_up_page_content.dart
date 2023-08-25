import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:skipee/utils/extension/extensions.dart';
import 'package:skipee/utils/validators/text_field_validator.dart';

import '../../../../global_widgets/widgets/continue_button.dart';
import '../../../../global_widgets/widgets/custom_text_form_field.dart';
import '../../../../../utils/constants/app_assets.dart';
import '../manager/sign_up_view_model.dart';

class SignUpPageContent extends StatefulWidget {
  const SignUpPageContent({Key? key}) : super(key: key);

  @override
  State<SignUpPageContent> createState() => _SignUpPageContentState();
}

class _SignUpPageContentState extends State<SignUpPageContent> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    context.read<SignUpViewModel>().onErrorMessage =
        (value) => context.show(message: value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 25.w, top: 25.h, bottom: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome to',
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.normal,
                            fontSize: 22.sp)),
                    SvgPicture.asset(AppAssets.logoSvg, height: 45.h),
                    Text('Buckle Up With Skipee',
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.normal,
                            fontSize: 24.sp)),
                  ],
                ),
              ),
              // SizedBox(
              //   height: 10.h,
              // ),
              Container(
                height: 610.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0.r),
                    topRight: Radius.circular(30.0.r),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 14.h),
                        CustomTextFormField(
                          maxLines: 1,
                          hintText:
                              context.read<SignUpViewModel>().fullNameHintText,
                          labelText:
                              context.read<SignUpViewModel>().fullNameLabelText,
                          controller: context
                              .read<SignUpViewModel>()
                              .fullNameController,
                          focusNode:
                              context.read<SignUpViewModel>().fullNameFocusNode,
                          keyboardType: TextInputType.name,
                          validator: TextFieldValidator.validateName,
                          onFieldSubmitted: (value) {
                            FocusScope.of(context).requestFocus(context
                                .read<SignUpViewModel>()
                                .phoneNumberFocusNode);
                          },
                        ),
                        SizedBox(height: 10.h),
                        CustomTextFormField(
                          maxLines: 1,
                          hintText: context
                              .read<SignUpViewModel>()
                              .phoneNumberHintText,
                          labelText: context
                              .read<SignUpViewModel>()
                              .phoneNumberLabelText,
                          controller: context
                              .read<SignUpViewModel>()
                              .phoneNumberController,
                          focusNode: context
                              .read<SignUpViewModel>()
                              .phoneNumberFocusNode,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(11),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.phone,
                          validator: TextFieldValidator.validatePhone,
                          onFieldSubmitted: (value) {
                            FocusScope.of(context).requestFocus(
                                context.read<SignUpViewModel>().emailFocusNode);
                          },
                        ),
                        SizedBox(height: 10.h),
                        CustomTextFormField(
                          maxLines: 1,
                          hintText:
                              context.read<SignUpViewModel>().emailHintText,
                          labelText:
                              context.read<SignUpViewModel>().emailLabelText,
                          controller:
                              context.read<SignUpViewModel>().emailController,
                          focusNode:
                              context.read<SignUpViewModel>().emailFocusNode,
                          keyboardType: TextInputType.emailAddress,
                          validator: TextFieldValidator.validateEmail,
                          onFieldSubmitted: (value) {
                            FocusScope.of(context).requestFocus(context
                                .read<SignUpViewModel>()
                                .passwordFocusNode);
                          },
                        ),
                        SizedBox(height: 10.h),
                        CustomTextFormField(
                          maxLines: 1,
                          obscureText: true,
                          hintText:
                              context.read<SignUpViewModel>().passwordHintText,
                          labelText:
                              context.read<SignUpViewModel>().passwordLabelText,
                          controller: context
                              .read<SignUpViewModel>()
                              .passwordController,
                          focusNode:
                              context.read<SignUpViewModel>().passwordFocusNode,
                          keyboardType: TextInputType.visiblePassword,
                          validator: TextFieldValidator.validatePassword,
                          onFieldSubmitted: (value) {
                            FocusScope.of(context).requestFocus(context
                                .read<SignUpViewModel>()
                                .confirmPasswordFocusNode);
                          },
                        ),
                        SizedBox(height: 12.h),
                        CustomTextFormField(
                          maxLines: 1,
                          obscureText: true,
                          hintText: context
                              .read<SignUpViewModel>()
                              .confirmPasswordHintText,
                          labelText: context
                              .read<SignUpViewModel>()
                              .confirmPasswordLabelText,
                          controller: context
                              .read<SignUpViewModel>()
                              .confirmPasswordController,
                          focusNode: context
                              .read<SignUpViewModel>()
                              .confirmPasswordFocusNode,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            return TextFieldValidator.validateConfirmPassword(
                                value,
                                context
                                    .read<SignUpViewModel>()
                                    .passwordController
                                    .text);
                          },
                          onFieldSubmitted: (value) {
                            FocusScope.of(context).requestFocus(FocusNode());
                          },
                        ),
                        SizedBox(height: 24.h),
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: 150.w,
                            height: 36.h,
                            child: ContinueButtonWidget(
                              loadingNotifier: context
                                  .read<SignUpViewModel>()
                                  .isLoadingNotifier,
                              text: 'SignUp',
                              onPressed: () async {
                                if (!_formKey.currentState!.validate()) {
                                  return;
                                }
                                await context
                                    .read<SignUpViewModel>()
                                    .registerUser();
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: context.read<SignUpViewModel>().moveToSignIn,
                            child: RichText(
                              text: TextSpan(
                                text: 'Already have an account ',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    ?.copyWith(
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan(
                                      text: 'Signin?',
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
