import 'package:dartz/dartz.dart';
import 'package:skipee/features/authentication/sign_in/models/login_request_model.dart';
import 'package:skipee/features/authentication/sign_in/models/login_response_model.dart';
import 'package:skipee/features/panels/preference_panel/models/get_profile_request_model.dart';

import '../../features/authentication/sign_up/models/register_request_model.dart';
import '../../features/panels/preference_panel/models/get_profile_response_model.dart';
import '../../features/panels/profile_panel/models/update_profile_request_model.dart';
import '../error/failure.dart';
import '../usecase/usecase.dart';

abstract class Repository {
  /// This method register the new user
  /// [Input] : [RegisterRequestModel] contains the user information
  /// [Output] : if operation successful returns [String] returns the successful message
  /// if unsuccessful the response will be [Failure]
  Future<Either<Failure, String>> registerUser(RegisterRequestModel params);

  /// This method logs in the user
  /// [Input] : [LoginRequestModel] contains the user credentials
  /// [Output] : if operation successful returns [LoginResponseModel] returns the user info
  /// if unsuccessful the response will be [Failure]
  Future<Either<Failure, LoginResponseModel>> login(LoginRequestModel params);

  /// This method saves the user info for later use
  /// [Input] : [LoginResponseModel] contains the user email and password
  /// [Output] : if operation successful returns [bool]
  /// if unsuccessful the response will be [Failure]
  Future<Either<Failure, bool>> saveSessionUser(LoginResponseModel params);

  /// This method gets the saved user info
  /// [Input] : [NoParams] no params for getting the user data
  /// [Output] : if operation successful returns [LoginResponseModel] returns the user info
  /// if unsuccessful the response will be [Failure]
  Future<Either<Failure, LoginResponseModel>> getSessionUser(NoParams params);

  /// This method logs out the user and remove the cache info of user
  /// [Input] : [NoParams] gets noParams for the input
  /// [Output] : if operation successful returns [bool] returns true
  /// if unsuccessful the response will be [Failure]
  Future<Either<Failure, bool>> logout(NoParams params);

  /// This method gets the user profile info including picture
  /// [Input] : [GetProfileRequestModel] gets mobile number for the input
  /// [Output] : if operation successful returns [GetProfileResponseModel] returns profile information
  /// if unsuccessful the response will be [Failure]
  Future<Either<Failure, GetProfileResponseModel>> getProfile(GetProfileRequestModel params);

  /// This method updates the user profile
  /// [Input] : [UpdateProfileRequestModel] gets updated information of user
  /// [Output] : if operation successful returns [String] returns successful message
  /// if unsuccessful the response will be [Failure]
  Future<Either<Failure, String>> updateProfile(UpdateProfileRequestModel params);
}
