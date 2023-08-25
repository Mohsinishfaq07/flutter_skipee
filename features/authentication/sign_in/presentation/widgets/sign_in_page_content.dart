import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:skipee/features/global_widgets/widgets/custom_text_form_field.dart';
import 'package:skipee/features/authentication/sign_in/presentation/manager/sign_in_view_model.dart';
import 'package:skipee/utils/constants/app_assets.dart';
import 'package:skipee/utils/extension/extensions.dart';
import '../../../../global_widgets/widgets/black_button_widget.dart';
import '../../../../../utils/constants/enums/page_state_enum.dart';
import '../../../../../utils/router/app_state.dart';
import '../../../../../utils/router/models/page_action.dart';
import '../../../../../utils/router/models/page_config.dart';
import '../../../../../utils/validators/text_field_validator.dart';

class SignInPageContent extends StatefulWidget {
  const SignInPageContent({Key? key}) : super(key: key);

  @override
  State<SignInPageContent> createState() => _SignInPageContentState();
}

class _SignInPageContentState extends State<SignInPageContent> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    context.read<SignInViewModel>().onErrorMessage =
        (value) => context.show(message: value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          backgroundColor: Colors.grey.shade200,
          resizeToAvoidBottomInset: true,
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: 34.w, top: 1.h, bottom: 5.h, right: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Padding(
                        padding:  EdgeInsets.only(top: 15.0.h,left: 5.w),
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Welcome to',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    ?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 22.sp)),

                            SvgPicture.asset(AppAssets.logoSvg, height: 44.h),
                            Text('Login to continue',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    ?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 22.sp)),],)
                    ),
                    SizedBox(height: 30.h),
                    SvgPicture.asset(
                      AppAssets.mapSvg,
                      height: 280.h,
                      //    width: double.infinity
                    ),

                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      Padding(
                        padding:  EdgeInsets.only(top:20.h),
                        child: Container(
                          // height: 312.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0.r),
                              topRight: Radius.circular(30.0.r),
                            ),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20, top: 18),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomTextFormField(
                                  maxLines: 1,
                                  hintText: context
                                      .read<SignInViewModel>()
                                      .phoneNumberHintText,
                                  labelText: context
                                      .read<SignInViewModel>()
                                      .phoneNumberLabelText,
                                  controller: context
                                      .read<SignInViewModel>()
                                      .phoneNumberController,
                                  focusNode: context
                                      .read<SignInViewModel>()
                                      .phoneNumberFocusNode,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(11),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  keyboardType: TextInputType.phone,
                                  validator: TextFieldValidator.validatePhone,
                                  onFieldSubmitted: (value) {
                                    FocusScope.of(context).requestFocus(context
                                        .read<SignInViewModel>()
                                        .passwordFocusNode);
                                  },
                                ),
                                  SizedBox(height: 6.h),
                                CustomTextFormField(
                                  maxLines: 1,
                                  obscureText: true,
                                  hintText: context
                                      .read<SignInViewModel>()
                                      .passwordHintText,
                                  labelText: context
                                      .read<SignInViewModel>()
                                      .passwordLabelText,
                                  controller: context
                                      .read<SignInViewModel>()
                                      .passwordController,
                                  focusNode: context
                                      .read<SignInViewModel>()
                                      .passwordFocusNode,
                                  keyboardType: TextInputType.visiblePassword,
                                  validator: TextFieldValidator.validatePassword,
                                  onFieldSubmitted: (value) {
                                    FocusScope.of(context).requestFocus(FocusNode());
                                  },
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: () {
                                      AppState appState = GetIt.I.get<AppState>();
                                      appState.currentAction = PageAction(
                                          state: PageState.addPage,
                                          page: PageConfigs.forgetPageConfig);
                                    },
                                    child: Text(
                                      'Forgot Password?',
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2
                                          ?.copyWith(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                BlackButtonWidget(formKey: _formKey, title: 'Login',),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: GestureDetector(
                                    onTap:
                                        context.read<SignInViewModel>().moveToSignUp,
                                    child: RichText(
                                      text: TextSpan(
                                        text: "Don't have an account ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2
                                            ?.copyWith(
                                                color: Theme.of(context).primaryColor,
                                                fontWeight: FontWeight.bold),
                                        children: [
                                          TextSpan(
                                              text: 'Signup?',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2
                                                  ?.copyWith(
                                                      fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 4,),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}


