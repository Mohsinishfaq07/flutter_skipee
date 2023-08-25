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

class ForgetScreen extends StatelessWidget {
  const ForgetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ForgetScreenContent();
  }
}

class ForgetScreenContent extends StatefulWidget {
  const ForgetScreenContent({Key? key}) : super(key: key);

  @override
  State<ForgetScreenContent> createState() => _ForgetScreenContentState();
}

class _ForgetScreenContentState extends State<ForgetScreenContent> {
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
      backgroundColor: Colors.grey.shade200,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(
              title: 'Forget Password',
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              height: 700.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0.r),
                  topRight: Radius.circular(30.0.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 20.0.w, top: 20.h, right: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Enter Register Phone Number',
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w300,
                              fontSize: 18.sp,
                            )),
                    SizedBox(height: 8.h),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 14.h),
                      child: const CustomTextFormField(
                          maxLines: 1,
                          hintText: ' Phone Number',
                          labelText: 'Enter Phone Number'),
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 150.w,
                        height: 36.h,
                        child: ContinueButtonWidget(
                          // loadingNotifier:
                          //     context.read<SignUpViewModel>().isLoadingNotifier,
                          text: 'Next',
                          onPressed: () async {
                            AppState appState = GetIt.I.get<AppState>();
                            appState.currentAction = PageAction(
                                state: PageState.addPage,
                                page: PageConfigs.otpPageConfig);

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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


