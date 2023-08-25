import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skipee/features/authentication/sign_in/presentation/manager/sign_in_view_model.dart';
import 'package:skipee/features/authentication/sign_in/presentation/widgets/sign_in_page_content.dart';

import '../../../../../app/globals.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final SignInViewModel _viewModel = sl();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: ChangeNotifierProvider.value(
              value: _viewModel, builder: (_, __) => const SignInPageContent()),
        ),
      ),
    );
  }
}
