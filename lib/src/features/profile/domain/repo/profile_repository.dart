import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../../data/model/change_password_response.dart';
import '../../data/model/user_profile_model.dart';
import '../../data/remote/profile_remote_ds.dart';

abstract class ProfileRepository {
  Future<Either<ErrorModel, ProfileResponse>> getProfile();
  Future<Either<ErrorModel, ProfileResponse>> updateProfile({
    required String firstName,
    required String lastName,
    required String phone,
    required String birthDate,
    String? image,
  });
   Future<Either<ErrorModel, PublicResponse>> changePassword(
      String oldPassword, String password, String passwordConfirmation);

      
      Future<Either<ErrorModel, PublicResponse>> deleteAccount();
      Future<Either<ErrorModel, PublicResponse>> logOut();
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
    required String phone,
    required String birthDate,
    // required String location,
    String? image,
  }) async {
    return await remoteDS.updateProfile(
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      birthDate: birthDate,
      //location: location,
      image: image,
    );
  }
  
  @override
  Future<Either<ErrorModel, PublicResponse>> changePassword(String oldPassword, String password, String passwordConfirmation) async {
    return await remoteDS.changePassword(oldPassword, password, passwordConfirmation);
  }
  
  @override
  Future<Either<ErrorModel, PublicResponse>> deleteAccount() async {
    return await remoteDS.deleteAccount();
  }
  
  @override
  Future<Either<ErrorModel, PublicResponse>> logOut() async {
    return await remoteDS.logOut();
  }
}
