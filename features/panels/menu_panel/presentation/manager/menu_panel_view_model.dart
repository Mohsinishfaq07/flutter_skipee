import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../services/error/failure.dart';

class MenuPanelViewModel extends ChangeNotifier {
  MenuPanelViewModel();

  // Usecases

  // Value Notifiers
  ValueChanged<String>? onErrorMessage;
  ValueNotifier<bool> isLoadingNotifier = ValueNotifier(false);

  // Fields

  // Usecase Calls

  // Error Handling
  void handleError(Either<Failure, dynamic> either) {
    isLoadingNotifier.value = false;
    either.fold((l) => onErrorMessage?.call(l.message), (r) => null);
  }
}
