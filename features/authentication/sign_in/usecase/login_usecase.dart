import 'package:dartz/dartz.dart';
import 'package:skipee/features/authentication/sign_in/models/login_request_model.dart';
import 'package:skipee/features/authentication/sign_in/models/login_response_model.dart';

import '../../../../services/error/failure.dart';
import '../../../../services/repository/repository.dart';
import '../../../../services/usecase/usecase.dart';

class LoginUsecase extends Usecase<LoginResponseModel, LoginRequestModel> {
  Repository repository;

  LoginUsecase(this.repository);

  @override
  Future<Either<Failure, LoginResponseModel>> call(LoginRequestModel params) async {
    return await repository.login(params);
  }
}
