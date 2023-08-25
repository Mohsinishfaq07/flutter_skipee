import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skipee/features/authentication/sign_up/presentation/manager/sign_up_view_model.dart';
import 'package:skipee/features/authentication/sign_up/presentation/widgets/sign_up_page_content.dart';

import '../../../../../app/globals.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final SignUpViewModel _viewModel = sl();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: ChangeNotifierProvider.value(value: _viewModel, builder: (_, __) => const SignUpPageContent()),
        ),
      ),
    );
  }
}
