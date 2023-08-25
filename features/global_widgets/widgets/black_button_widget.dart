import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../authentication/sign_in/presentation/manager/sign_in_view_model.dart';
import 'continue_button.dart';

class BlackButtonWidget extends StatelessWidget {
  const BlackButtonWidget({
    Key? key,
    required this .title,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey, super(key: key);

  final GlobalKey<FormState> _formKey;
  final  String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 150.w,
        height: 36.h,
        child: ContinueButtonWidget(
          text: title,
          loadingNotifier: context
              .read<SignInViewModel>()
              .isLoadingNotifier,
          onPressed: () async {
            if (!_formKey.currentState!.validate()) {
              return;
            }
            await context.read<SignInViewModel>().login();
          },
        ),
      ),
    );
  }
}