import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import '../../../../global_widgets/widgets/custom_app_bar.dart';
import '../../../../../utils/constants/enums/page_state_enum.dart';
import '../../../../../utils/router/app_state.dart';
import '../../../../../utils/router/models/page_action.dart';
import '../../../../../utils/router/models/page_config.dart';
import '../../../../home/presentation/widgets/buttons/custom_otp.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const OtpScreenContent();
  }
}

class OtpScreenContent extends StatefulWidget {
  const OtpScreenContent({Key? key}) : super(key: key);

  @override
  State<OtpScreenContent> createState() => _OtpScreenContentState();
}

class _OtpScreenContentState extends State<OtpScreenContent> {
//  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(
              title: 'Forget Password',
            ),
            SizedBox(
              height: 40.h,
            ),
            Container(
              height: 650.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0.r),
                  topRight: Radius.circular(30.0.r),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 28.h,
                  ),
                  Text('OTP Verification',
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.normal,
                          )),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 20.w, top: 15.h, bottom: 12.h),
                    child: Text('Enter the OTP received on your mobile number.',
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp)),
                  ),
                  CustomOtpFields(
                    onChanged: (String) {},
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 14.w,top: 5.h
                    ),
                    child: Wrap(
                      children: [
                        Text(
                          'Please click',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.sp),
                        ),
                        GestureDetector(
                          onTap: () async {
                            AppState appState = GetIt.I.get<AppState>();
                            appState.currentAction = PageAction(
                                state: PageState.replace,
                                page: PageConfigs.newPasswordPageConfig);
                            Navigator.pop(context);

                            // await context
                            //     .read<SignUpViewModel>()
                            //     .registerUser();
                          },
                          child: Text(
                            '"here"',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp),
                          ),
                        ),
                        Text("if you don't recieve OTP within ",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                ?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14.sp)),
                        Align(
                          alignment: Alignment.center,
                          child: Text('30 seconds',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  ?.copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14.sp)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
