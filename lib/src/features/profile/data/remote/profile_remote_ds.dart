import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../model/change_password_response.dart';
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
   Future<Either<ErrorModel, ChangePasswordResponse>> changePassword(
      String oldPassword, String password, String passwordConfirmation);
      
      Future<Either<ErrorModel, ChangePasswordResponse>> deleteAccount();
      Future<Either<ErrorModel, ChangePasswordResponse>> logOut();
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
  
  @override
  Future<Either<ErrorModel, ChangePasswordResponse>> changePassword(String oldPassword, String password, String passwordConfirmation) async {
    return api.changePassword(oldPassword, password, passwordConfirmation);
  }
  
  @override
  Future<Either<ErrorModel, ChangePasswordResponse>> deleteAccount() async {
    return api.deleteAccount();
  }
  
  @override
  Future<Either<ErrorModel, ChangePasswordResponse>> logOut() async {
    return api.logOut();
  }

  
}
