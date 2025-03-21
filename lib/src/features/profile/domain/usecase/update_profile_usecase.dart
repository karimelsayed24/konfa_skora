import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../../data/model/user_profile_model.dart';
import '../repo/profile_repository.dart';

class UpdateProfileParams {
  final String firstName;
  final String lastName;
  final String phone;
  final String birthDate;
  final String? image;

  UpdateProfileParams({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.birthDate,
    this.image,
  });
}

class UpdateProfileUseCase {
  final ProfileRepository repository;

  UpdateProfileUseCase(this.repository);

  Future<Either<ErrorModel, ProfileResponse>> call(UpdateProfileParams params) async {
    return await repository.updateProfile(
      firstName: params.firstName,
      lastName: params.lastName,
      phone: params.phone,
      birthDate: params.birthDate,
      image: params.image,
    );
  }
}