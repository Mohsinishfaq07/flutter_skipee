import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:skipee/features/authentication/sign_in/models/login_request_model.dart';
import 'package:skipee/features/authentication/sign_in/usecase/login_usecase.dart';
import 'package:skipee/features/authentication/sign_in/usecase/save_session_user_usecase.dart';
import 'package:skipee/utils/constants/enums/page_state_enum.dart';
import 'package:skipee/utils/router/models/page_action.dart';
import 'package:skipee/utils/router/models/page_config.dart';

import '../../../../../app/providers/account_provider.dart';
import '../../../../../services/error/failure.dart';
import '../../../../../utils/router/app_state.dart';

class SignInViewModel extends ChangeNotifier {
  SignInViewModel(
      {required this.loginUsecase, required this.saveSessionUserUsecase});

  // Usecases
  LoginUsecase loginUsecase;
  SaveSessionUserUsecase saveSessionUserUsecase;

  // Value Notifiers
  ValueChanged<String>? onErrorMessage;
  ValueNotifier<bool> isLoadingNotifier = ValueNotifier(false);

  // App States
  AppState appState = GetIt.I.get<AppState>();

  // Fields
  final TextEditingController phoneNumberController = TextEditingController();
  final String phoneNumberLabelText = 'Enter phone number';
  final String phoneNumberHintText = 'Phone Number';
  final FocusNode phoneNumberFocusNode = FocusNode();

  final TextEditingController passwordController = TextEditingController();
  final String passwordLabelText = '********';
  final String passwordHintText = 'Password';
  final FocusNode passwordFocusNode = FocusNode();

  // Usecase Calls
  Future<void> login() async {
    isLoadingNotifier.value = true;
    LoginRequestModel model = LoginRequestModel(
      phoneNumber: phoneNumberController.text,
      password: passwordController.text,
    );
    var registrationEither = await loginUsecase.call(model);

    if (registrationEither.isLeft()) {
      handleError(registrationEither);
      isLoadingNotifier.value = false;
      return;
    } else if (registrationEither.isRight()) {
      registrationEither.foldRight(null, (r, previous) async {
        await saveSessionUserUsecase.call(r);
        GetIt.I.get<AccountProvider>().cacheUserProfileData(r);
      });
      isLoadingNotifier.value = false;
      moveToHome();
    }
  }

  // Error Handling
  void handleError(Either<Failure, dynamic> either) {
    isLoadingNotifier.value = false;
    either.fold((l) => onErrorMessage?.call(l.message), (r) => null);
  }

  // Moving Pages
  void moveToSignUp() {
    appState.currentAction = PageAction(
        state: PageState.addPage, page: PageConfigs.signUpPageConfig);
  }

  void moveToForgetPassword() {
    appState.currentAction = PageAction(
        state: PageState.replace, page: PageConfigs.forgetPageConfig);
  }

  void moveToHome() {
    appState.currentAction =
        PageAction(state: PageState.replace, page: PageConfigs.homePageConfig);
  }
}
