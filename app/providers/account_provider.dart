import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:skipee/features/panels/preference_panel/models/get_profile_response_model.dart';

import '../../features/authentication/sign_in/models/login_response_model.dart';
import '../../services/error/failure.dart';
import '../../services/usecase/usecase.dart';
import '../../utils/constants/enums/page_state_enum.dart';
import '../../utils/router/app_state.dart';
import '../../utils/router/models/page_action.dart';
import '../../utils/router/models/page_config.dart';
import '../usecase/logout_usecase.dart';

class AccountProvider extends ChangeNotifier {
  AccountProvider({required this.logoutUsecase});

  LogoutUseCase logoutUsecase;

  ValueChanged<String>? errorMessage;
  ValueNotifier<bool> isLoadingNotifier = ValueNotifier(false);

  GetProfileResponseModel? profileDetails;

  void makeActionsBasedOnError(Failure l) {
    errorMessage?.call(l.message);
  }

  void handleError(Either<Failure, dynamic> either) {
    either.fold((l) {
      makeActionsBasedOnError(l);
    }, (r) => null);
  }

  int userId = 0;
  String fullName = '';
  String phoneNumber = '';
  String emailAddress = '';
  String password = '';
  String token = '';

  void cacheUserProfileData(LoginResponseModel params) {
    userId = params.userId;
    fullName = params.fullName;
    phoneNumber = params.phoneNumber;
    emailAddress = params.emailAddress;
    password = params.password;
    token = params.token;
  }

  void logout() async {
    isLoadingNotifier.value = true;
    var logoutEither = await logoutUsecase.call(NoParams());

    if (logoutEither.isLeft()) {
      handleError(logoutEither);
      isLoadingNotifier.value = false;
      return;
    } else if (logoutEither.isRight()) {
      isLoadingNotifier.value = false;
      moveToSplashPage();
    }
  }

  void moveToSplashPage() {
    var appState = GetIt.I.get<AppState>();
    appState.currentAction = PageAction(
        state: PageState.replaceAll, page: PageConfigs.splashPageConfig);
  }
}
