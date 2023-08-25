import 'package:cached_network_image/cached_network_image.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:skipee/features/panels/profile_panel/presentation/manager/profile_panel_view_model.dart';

import '../../../../../app/globals.dart';
import '../../../../../app/providers/account_provider.dart';
import '../../../../../services/error/failure.dart';
import '../../../../../utils/constants/app_assets.dart';
import '../../models/get_profile_request_model.dart';
import '../../usecase/get_profile_usecase.dart';

class PreferencePanelViewModel extends ChangeNotifier {
  PreferencePanelViewModel({required this.getProfileUsecase});

  // Usecases
  GetProfileUsecase getProfileUsecase;

  // Value Notifiers
  ValueChanged<String>? onErrorMessage;
  ValueNotifier<bool> isLoadingNotifier = ValueNotifier(false);
  ValueNotifier<bool> isProfileLoading = ValueNotifier(false);

  // Fields

  // Getters
  AccountProvider get accountProvider => sl();
  ProfilePanelViewModel get profilePanelViewModel => sl();

  // Usecase Calls
  Future<void> getProfile() async {
    if (accountProvider.profileDetails != null) {
      return;
    }
    isProfileLoading.value = true;
    var getProfileEither = await getProfileUsecase.call(GetProfileRequestModel(phoneNumber: accountProvider.phoneNumber, authToken: ''));

    if (getProfileEither.isLeft()) {
      handleError(getProfileEither);
      isProfileLoading.value = false;
      return;
    } else if (getProfileEither.isRight()) {
      getProfileEither.foldRight(null, (r, previous) {
        accountProvider.profileDetails = r;
        profilePanelViewModel.loadProfileDetails();
      });
      isProfileLoading.value = false;
    }
  }

  // Methods
  ImageProvider getImageProvider(BuildContext context) {
    bool imageCondition = accountProvider.profileDetails == null || accountProvider.profileDetails?.imageUrl == null;
    if (imageCondition) {
      return const AssetImage(AppAssets.defaultImagePng);
    } else {
      return CachedNetworkImageProvider(accountProvider.profileDetails!.imageUrl!);
    }
  }

  // Error Handling
  void handleError(Either<Failure, dynamic> either) {
    isLoadingNotifier.value = false;
    either.fold((l) => onErrorMessage?.call(l.message), (r) => null);
  }
}
