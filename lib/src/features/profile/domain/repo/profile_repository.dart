import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../../data/model/user_profile_model.dart';
import '../../data/remote/profile_remote_ds.dart';

abstract class ProfileRepository {
  Future<Either<ErrorModel, ProfileResponse>> getProfile();
  Future<Either<ErrorModel, ProfileResponse>> updateProfile({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String birthDate,
    //required String location,
    String? image,
  });
}

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDs remoteDS;

  ProfileRepositoryImpl(this.remoteDS);

  @override
  Future<Either<ErrorModel, ProfileResponse>> getProfile() async {
    return await remoteDS.getProfile();
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
    return await remoteDS.updateProfile(
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      birthDate: birthDate,
      //location: location,
      image: image,
    );
  }
}
