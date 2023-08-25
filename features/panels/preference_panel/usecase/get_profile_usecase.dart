import 'package:dartz/dartz.dart';
import 'package:skipee/features/panels/preference_panel/models/get_profile_request_model.dart';

import '../../../../../services/error/failure.dart';
import '../../../../../services/repository/repository.dart';
import '../../../../../services/usecase/usecase.dart';
import '../models/get_profile_response_model.dart';

class GetProfileUsecase extends Usecase<GetProfileResponseModel, GetProfileRequestModel> {
  Repository repository;

  GetProfileUsecase(this.repository);

  @override
  Future<Either<Failure, GetProfileResponseModel>> call(GetProfileRequestModel params) async {
    return await repository.getProfile(params);
  }
}
