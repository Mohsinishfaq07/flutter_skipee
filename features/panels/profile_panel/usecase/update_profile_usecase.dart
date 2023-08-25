import 'package:dartz/dartz.dart';
import 'package:skipee/features/panels/profile_panel/models/update_profile_request_model.dart';

import '../../../../../services/error/failure.dart';
import '../../../../../services/repository/repository.dart';
import '../../../../../services/usecase/usecase.dart';

class UpdateProfileUsecase extends Usecase<String, UpdateProfileRequestModel> {
  Repository repository;

  UpdateProfileUsecase(this.repository);

  @override
  Future<Either<Failure, String>> call(UpdateProfileRequestModel params) async {
    return await repository.updateProfile(params);
  }
}
