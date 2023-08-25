import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

GlobalKey<NavigatorState> navigatorKeyGlobal = GlobalKey<NavigatorState>();
final sl = GetIt.instance;

final GlobalKey<NavigatorState> innerNavigatorKey = GlobalKey<NavigatorState>();
