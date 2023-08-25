import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../services/error/failure.dart';

class SecurityPanelViewModel extends ChangeNotifier {
  // Usecases

  // Value Notifiers
  ValueChanged<String>? onErrorMessage;
  ValueNotifier<bool> isLoadingNotifier = ValueNotifier(false);
  ValueNotifier<bool> oldObsecureTextNotifier = ValueNotifier(true);
  ValueNotifier<bool> newObsecureTextNotifier = ValueNotifier(true);
  ValueNotifier<bool> confirmObsecureTextNotifier = ValueNotifier(true);

  // Fields
  final TextEditingController oldPasswordController = TextEditingController();
  final String oldPasswordLabelText = '********';
  final String oldPasswordHintText = 'Old Password';
  final FocusNode oldPasswordFocusNode = FocusNode();

  final TextEditingController newPasswordController = TextEditingController();
  final String newPasswordLabelText = '********';
  final String newPasswordHintText = 'New Password';
  final FocusNode newPasswordFocusNode = FocusNode();

  final TextEditingController confirmPasswordController = TextEditingController();
  final String confirmPasswordLabelText = '********';
  final String confirmPasswordHintText = 'Confirm Password';
  final FocusNode confirmPasswordFocusNode = FocusNode();

  // Usecase Calls

  // Methods
  void changeOldObsecureText() {
    oldObsecureTextNotifier.value = !oldObsecureTextNotifier.value;
  }

  void changeNewObsecureText() {
    newObsecureTextNotifier.value = !newObsecureTextNotifier.value;
  }

  void changeConfirmObsecureText() {
    confirmObsecureTextNotifier.value = !confirmObsecureTextNotifier.value;
  }

  // Error Handling
  void handleError(Either<Failure, dynamic> either) {
    isLoadingNotifier.value = false;
    either.fold((l) => onErrorMessage?.call(l.message), (r) => null);
  }
}
