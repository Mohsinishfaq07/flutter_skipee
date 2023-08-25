import 'package:dartz/dartz.dart';

import '../../../../services/error/failure.dart';
import '../../../../services/repository/repository.dart';
import '../../../../services/usecase/usecase.dart';
import '../models/login_response_model.dart';

class SaveSessionUserUsecase implements Usecase<bool, LoginResponseModel> {
  Repository repository;

  SaveSessionUserUsecase(this.repository);

  @override
  Future<Either<Failure, bool>> call(LoginResponseModel params) async {
    return await repository.saveSessionUser(params);
  }
}
