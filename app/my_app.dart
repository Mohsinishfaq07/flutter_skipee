import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/constants/app_theme.dart';
import '../utils/router/skipee_back_button_dispatcher.dart';
import '../utils/router/skipee_router_delegate.dart';
import '../utils/router/skipee_router_parser.dart';
import 'globals.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late SkipeeRouterDelegate delegate;
  late SkipeeBackButtonDispatcher backButtonDispatcher;
  late SkipeeRouterParser parser = SkipeeRouterParser();

  @override
  void initState() {
    delegate = SkipeeRouterDelegate(sl());
    backButtonDispatcher = SkipeeBackButtonDispatcher(sl());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (ch, c) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Skipee',
        theme: AppTheme.appTheme,
        routerDelegate: delegate,
        // backButtonDispatcher: backButtonDispatcher,
        routeInformationParser: parser,
      ),
    );
  }
}
