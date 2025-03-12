import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../../data/model/user_profile_model.dart';
import '../repo/profile_repository.dart';

class GetProfileUseCase {
  final ProfileRepository repository;

  GetProfileUseCase(this.repository);

  Future<Either<ErrorModel, ProfileResponse>> call() async {
    return await repository.getProfile();
  }
}


