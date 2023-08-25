import 'package:dartz/dartz.dart';

import '../../../../services/error/failure.dart';
import '../../../../services/repository/repository.dart';
import '../../../../services/usecase/usecase.dart';
import '../models/register_request_model.dart';

class RegisterUsecase extends Usecase<String, RegisterRequestModel> {
  Repository repository;

  RegisterUsecase(this.repository);

  @override
  Future<Either<Failure, String>> call(RegisterRequestModel params) async {
    return await repository.registerUser(params);
  }
}
