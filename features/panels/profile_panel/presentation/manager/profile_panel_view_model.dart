import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skipee/features/authentication/sign_in/models/login_response_model.dart';
import 'package:skipee/features/authentication/sign_in/usecase/save_session_user_usecase.dart';
import 'package:skipee/features/panels/preference_panel/presentation/manager/preference_panel_view_model.dart';

import '../../../../../app/globals.dart';
import '../../../../../app/providers/account_provider.dart';
import '../../../../../services/error/failure.dart';
import '../../models/update_profile_request_model.dart';
import '../../usecase/update_profile_usecase.dart';

class ProfilePanelViewModel extends ChangeNotifier {
  ProfilePanelViewModel({required this.updateProfileUsecase, required this.saveSessionUserUsecase});

  // Usecases
  UpdateProfileUsecase updateProfileUsecase;
  SaveSessionUserUsecase saveSessionUserUsecase;

  // Value Notifiers
  ValueChanged<String>? onErrorMessage;
  ValueNotifier<bool> isLoadingNotifier = ValueNotifier(false);
  ValueNotifier<bool> isProfileUpdateLoading = ValueNotifier(false);

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

  final ImagePicker imagePicker = ImagePicker();
  ValueNotifier<File?> imageFile = ValueNotifier<File?>(null);
  String? imageType;
  String? imageName;
  String? imageBase64;

  // Getters
  AccountProvider get accountProvider => sl();
  PreferencePanelViewModel get preferencePanelViewModel => sl();

  // Usecase Calls
  Future<void> updateProfile() async {
    if (isProfileUpdateAllowed()) {
      return;
    }
    isProfileUpdateLoading.value = true;
    var updateProfileEither = await updateProfileUsecase.call(
      UpdateProfileRequestModel(
          id: accountProvider.profileDetails!.id,
          fullName: fullNameController.text,
          phoneNumber: phoneNumberController.text,
          email: emailController.text,
          imageUrl: imageBase64,
          authToken: ''),
    );

    if (updateProfileEither.isLeft()) {
      handleError(updateProfileEither);
      isProfileUpdateLoading.value = false;
      return;
    } else if (updateProfileEither.isRight()) {
      onErrorMessage?.call('Profile updated successfully!');
      var sessionModel = LoginResponseModel(
        userId: accountProvider.userId,
        fullName: accountProvider.fullName,
        emailAddress: accountProvider.emailAddress,
        phoneNumber: accountProvider.phoneNumber,
        password: accountProvider.password,
        token: accountProvider.token,
      );
      sessionModel = sessionModel.copyWith(fullName: fullNameController.text, emailAddress: emailController.text, phoneNumber: phoneNumberController.text);
      await saveSessionUserUsecase.call(sessionModel);
      accountProvider.cacheUserProfileData(sessionModel);
      accountProvider.profileDetails = null;
      isProfileUpdateLoading.value = false;
    }
  }

  // Methods
  ImageProvider getUpdateImageProvider(BuildContext context, File? file) {
    if (file != null) {
      return MemoryImage(imageFile.value!.readAsBytesSync());
    } else {
      return preferencePanelViewModel.getImageProvider(context);
    }
  }

  Future<void> getImageFromGallery() async {
    XFile? image = await imagePicker.pickImage(source: ImageSource.gallery, imageQuality: 20);
    if (image != null) {
      imageFile.value = File(image.path);
      var rawImageName = image.name;
      imageName = rawImageName.split('.').first;
      imageType = rawImageName.split('.').last;
      encodeToBase64(imageFile.value);
    }
  }

  Future<void> getImageFromCamera() async {
    XFile? image = await imagePicker.pickImage(source: ImageSource.camera, imageQuality: 20);
    if (image != null) {
      imageFile.value = File(image.path);
      var rawImageName = image.name;
      imageName = rawImageName.split('.').first;
      imageType = rawImageName.split('.').last;
      encodeToBase64(imageFile.value);
    }
  }

  void encodeToBase64(File? file) {
    if (file != null) {
      List<int> imageBytes = file.readAsBytesSync();
      imageBase64 = base64Encode(imageBytes);
    }
  }

  bool isProfileUpdateAllowed() {
    if (fullNameController.text.trim() == accountProvider.profileDetails!.fullName &&
        phoneNumberController.text.trim() == accountProvider.profileDetails!.phoneNumber &&
        emailController.text.trim() == accountProvider.profileDetails!.email &&
        imageFile.value == null) {
      return true;
    } else {
      return false;
    }
  }

  void loadProfileDetails() {
    if (accountProvider.profileDetails != null) {
      fullNameController.text = accountProvider.profileDetails!.fullName;
      phoneNumberController.text = accountProvider.profileDetails!.phoneNumber;
      emailController.text = accountProvider.profileDetails!.email;
    }
  }

  // Error Handling
  void handleError(Either<Failure, dynamic> either) {
    isLoadingNotifier.value = false;
    either.fold((l) => onErrorMessage?.call(l.message), (r) => null);
  }
}
