import 'package:dartz/dartz.dart';

import '../../../services/error/failure.dart';
import '../../../services/repository/repository.dart';
import '../../../services/usecase/usecase.dart';
import '../../authentication/sign_in/models/login_response_model.dart';

class GetSessionUserUsecase implements Usecase<LoginResponseModel, NoParams> {
  Repository repository;

  GetSessionUserUsecase(this.repository);

  @override
  Future<Either<Failure, LoginResponseModel>> call(NoParams params) async {
    return await repository.getSessionUser(params);
  }
}
