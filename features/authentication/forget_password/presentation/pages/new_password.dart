import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:skipee/features/global_widgets/widgets/custom_text_form_field.dart';
import '../../../../global_widgets/widgets/continue_button.dart';
import '../../../../global_widgets/widgets/custom_app_bar.dart';
import '../../../../../utils/constants/enums/page_state_enum.dart';
import '../../../../../utils/router/app_state.dart';
import '../../../../../utils/router/models/page_action.dart';
import '../../../../../utils/router/models/page_config.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NewPasswordScreenContent();
  }
}

class NewPasswordScreenContent extends StatefulWidget {
  const NewPasswordScreenContent({Key? key}) : super(key: key);

  @override
  State<NewPasswordScreenContent> createState() =>
      _NewPasswordScreenContentState();
}

class _NewPasswordScreenContentState extends State<NewPasswordScreenContent> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   @override
//   void initState() {
//     // context.read<SignUpViewModel>().onErrorMessage =
//     //     (value) => context.show(message: value);
//     super.initState();
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(
              title: 'New Password',
            ),
            SizedBox(
              height: 40.h,
            ),
            Container(
              height: 670.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0.r),
                  topRight: Radius.circular(30.0.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 30.0.h, left: 20.w),
                    child: Text('Set New Password',
                        style:
                            Theme.of(context).textTheme.headline5?.copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                )),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 20.w, top: 16.h, bottom: 10.h,right: 20.w),
                    child: const CustomTextFormField(
                      obscureText: true,
                      maxLines: 1,
                      hintText: ' Password',
                      labelText: 'Enter Password ',
                      obsecureSuffix: true,
                      showSuffixIcon: true,
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(left: 20.w, top: 5.h, bottom: 20.h,right: 20.w),
                    child: const CustomTextFormField(
                      obscureText: true,
                      maxLines: 1,
                      hintText:' Re -  enter Password',
                      labelText: 'Enter New  Password ',
                      obsecureSuffix: true,
                      showSuffixIcon: true,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 160.w,
                      height: 36.h,
                      child: ContinueButtonWidget(
                        // loadingNotifier:
                        //     context.read<SignUpViewModel>().isLoadingNotifier,
                        text: 'Update',
                        onPressed: () async {
                          AppState appState = GetIt.I.get<AppState>();
                          appState.currentAction = PageAction(
                              state: PageState.replace,
                              page: PageConfigs.signInPageConfig);
                          Navigator.pop(context);
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          // await context
                          //     .read<SignUpViewModel>()
                          //     .registerUser();
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  // Align(
                  //   alignment: Alignment.center,
                  //   child: GestureDetector(
                  //     onTap: context.read<SignUpViewModel>().moveToSignIn,
                  //     child: RichText(
                  //       text: TextSpan(
                  //         text: 'Already have an account? ',
                  //         style: Theme.of(context)
                  //             .textTheme
                  //             .subtitle1
                  //             ?.copyWith(
                  //                 color: Theme.of(context).primaryColor),
                  //         children: [
                  //           TextSpan(
                  //               text: 'Sign In',
                  //               style: Theme.of(context)
                  //                   .textTheme
                  //                   .subtitle1
                  //                   ?.copyWith(fontWeight: FontWeight.bold)),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
