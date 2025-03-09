import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../model/user_profile_model.dart';
import 'profile_api_services.dart';

abstract class ProfileRemoteDs {
  Future<Either<ErrorModel, ProfileResponse>> getProfile();
  Future<Either<ErrorModel, ProfileResponse>> updateProfile({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String birthDate,
   // required String location,
    String? image,
  });
}

class ProfileRemoteDsImpl implements ProfileRemoteDs {
  final ProfileApiServices api;
  ProfileRemoteDsImpl( this.api);
  @override
  Future<Either<ErrorModel, ProfileResponse>> getProfile() async {
    return api.getProfile();
  }

  @override
  Future<Either<ErrorModel, ProfileResponse>> updateProfile({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String birthDate,
    // required String location,
    String? image,
  }) async {
    return api.updateProfile(
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      birthDate: birthDate,
      image: image,
    );
  }
}
