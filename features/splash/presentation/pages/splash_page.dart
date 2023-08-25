import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skipee/features/splash/presentation/manager/splash_view_model.dart';
import '../../../../app/globals.dart';
import '../widgets/splash_page_content.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashViewModel _viewModel = sl();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: ChangeNotifierProvider.value(
              value: _viewModel, builder: (_, __) => const IntroductionScreenContent()),
        ),
      ),
    );
  }
}
