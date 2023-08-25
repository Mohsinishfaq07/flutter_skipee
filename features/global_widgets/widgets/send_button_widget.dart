import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'continue_button.dart';

class SendButtonWidget extends StatelessWidget {
  const SendButtonWidget({Key? key, required this.title, this.ontap}) : super(key: key);
  final String title;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 146.w,
      height: 42.h,
      child: ContinueButtonWidget(

        // loadingNotifier:
        //     context.read<SignUpViewModel>().isLoadingNotifier,
        text: title,
        onPressed:ontap,
        backgroundColor: Colors.black,

      ),
    );
  }
}
