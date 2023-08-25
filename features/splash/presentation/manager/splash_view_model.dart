import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:skipee/features/splash/usecase/get_session_user_usecase.dart';
import 'package:skipee/utils/constants/enums/page_state_enum.dart';
import 'package:skipee/utils/router/models/page_action.dart';
import 'package:skipee/utils/router/models/page_config.dart';

import '../../../../app/providers/account_provider.dart';
import '../../../../services/error/failure.dart';
import '../../../../services/usecase/usecase.dart';
import '../../../../utils/router/app_state.dart';

class SplashViewModel extends ChangeNotifier {
  SplashViewModel({required this.getSessionUserUsecase});

  // Usecases
  GetSessionUserUsecase getSessionUserUsecase;

  ValueChanged<String>? onErrorMessage;
  ValueNotifier<bool> isLoadingNotifier = ValueNotifier(false);

  AppState appState = GetIt.I.get<AppState>();

  Future<void> getSessionUserData() async {
    isLoadingNotifier.value = true;
    var modelEither = await getSessionUserUsecase.call(NoParams());

    if (modelEither.isLeft()) {
      print('Error: ');
      Timer(const Duration(seconds: 2), moveToSignInPage);
    } else if (modelEither.isRight()) {
      modelEither.fold((l) => null, (r) async {
        print(r.toJson());
        GetIt.I.get<AccountProvider>().cacheUserProfileData(r);
      //  Timer(const Duration(seconds: 10), moveToHome);
      });
    }
  }

  void handleError(Either<Failure, dynamic> either) {
    isLoadingNotifier.value = false;
    either.fold((l) => onErrorMessage?.call(l.message), (r) => null);
  }

  void moveToSignInPage() {
    isLoadingNotifier.value = false;
    appState.currentAction = PageAction(
        state: PageState.replace, page: PageConfigs.signInPageConfig);
  }

  void moveToHome() {
    isLoadingNotifier.value = false;
    appState.currentAction = PageAction(
        state: PageState.replaceAll, page: PageConfigs.homePageConfig);
  }
}
