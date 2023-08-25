import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skipee/features/home/presentation/manager/home_view_model.dart';
import 'package:skipee/features/home/presentation/pages/home_page_content.dart';
import '../../../../../app/globals.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeViewModel _viewModel = sl();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: ChangeNotifierProvider.value(value: _viewModel, builder: (_, __) => const HomePageContent()),
        ),
      ),
    );
  }
}
