import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:skipee/features/authentication/sign_up/models/register_request_model.dart';
import 'package:skipee/features/authentication/sign_up/usecase/register_usecase.dart';

import '../../../../../services/error/failure.dart';
import '../../../../../utils/constants/enums/page_state_enum.dart';
import '../../../../../utils/router/app_state.dart';
import '../../../../../utils/router/models/page_action.dart';
import '../../../../../utils/router/models/page_config.dart';

class SignUpViewModel extends ChangeNotifier {
  SignUpViewModel(this.registerUsecase);

  // Usecases
  RegisterUsecase registerUsecase;

  // Value Notifiers
  ValueChanged<String>? onErrorMessage;
  ValueNotifier<bool> isLoadingNotifier = ValueNotifier(false);

  // App States
  AppState appState = GetIt.I.get<AppState>();

  // Fields
  final TextEditingController fullNameController = TextEditingController();
  final String fullNameLabelText = 'Enter your name';
  final String fullNameHintText = 'Full Name';
  final FocusNode fullNameFocusNode = FocusNode();

  final TextEditingController phoneNumberController = TextEditingController();
  final String phoneNumberLabelText = 'Enter phone number';
  final String phoneNumberHintText = 'Phone Number';
  final FocusNode phoneNumberFocusNode = FocusNode();

  final TextEditingController emailController = TextEditingController();
  final String emailLabelText = 'Enter your email';
  final String emailHintText = 'Email (Optional)';
  final FocusNode emailFocusNode = FocusNode();

  final TextEditingController passwordController = TextEditingController();
  final String passwordLabelText = '********';
  final String passwordHintText = 'Password';
  final FocusNode passwordFocusNode = FocusNode();

  final TextEditingController confirmPasswordController =
      TextEditingController();
  final String confirmPasswordLabelText = '********';
  final String confirmPasswordHintText = 'Re-Enter Password';
  final FocusNode confirmPasswordFocusNode = FocusNode();

  // Usecase Calls
  Future<void> registerUser() async {
    isLoadingNotifier.value = true;
    RegisterRequestModel model = RegisterRequestModel(
      fullName: fullNameController.text,
      phoneNumber: phoneNumberController.text,
      email: emailController.text,
      password: confirmPasswordController.text,
    );
    var registrationEither = await registerUsecase.call(model);

    if (registrationEither.isLeft()) {
      handleError(registrationEither);
      isLoadingNotifier.value = false;
      return;
    } else if (registrationEither.isRight()) {
      registrationEither.foldRight(null, (r, previous) {
        onErrorMessage?.call(r);
      });
      isLoadingNotifier.value = false;
      moveToSignIn();
    }
  }

  // Error Handling
  void handleError(Either<Failure, dynamic> either) {
    isLoadingNotifier.value = false;
    either.fold((l) => onErrorMessage?.call(l.message), (r) => null);
  }

  // Moving Pages
  void moveToSignIn() {
    appState.currentAction = PageAction(
        state: PageState.replaceAll, page: PageConfigs.signInPageConfig);
  }
}
