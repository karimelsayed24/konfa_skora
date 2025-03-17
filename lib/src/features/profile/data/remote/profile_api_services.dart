import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/constants/endpoints_strings.dart';
import '../../../../../core/data/api/api_consumer.dart';
import '../../../../../core/errors/error_model.dart';
import '../../../../../core/errors/exceptions.dart';
import '../model/change_password_response.dart';
import '../model/user_profile_model.dart';

abstract class ProfileApiServices {
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

  //change password
  Future<Either<ErrorModel, PublicResponse>> changePassword(
      String oldPassword, String password, String passwordConfirmation);

      Future<Either<ErrorModel, PublicResponse>> deleteAccount();
      Future<Either<ErrorModel, PublicResponse>> logOut();
}

class ProfileApiServicesImpl implements ProfileApiServices {
  final ApiConsumer api;

  ProfileApiServicesImpl(this.api);

  @override
  Future<Either<ErrorModel, ProfileResponse>> getProfile() async {
    try {
      final response = await api.get(EndpointsStrings.getProfile);
      final profileResponse = ProfileResponse.fromJson(response);
      return Right(profileResponse);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
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
    try {
      Map<String, dynamic> data = {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'phone': phone,
        'birth_date': birthDate,
        //'location': location,
      };

      if (image != null) {
        String fileName = image.split('/').last;
        FormData formData = FormData.fromMap({
          ...data,
          'image': await MultipartFile.fromFile(image, filename: fileName),
        });

        // Send formData instead of regular data
        final response =
            await api.post(EndpointsStrings.updateProfile, data: formData);
        final profileResponse = ProfileResponse.fromJson(response);
        return Right(profileResponse);
      } else {
        final response =
            await api.post(EndpointsStrings.updateProfile, data: data);
        final profileResponse = ProfileResponse.fromJson(response);
        return Right(profileResponse);
      }
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, PublicResponse>> changePassword(
      String oldPassword, String password, String passwordConfirmation) async {
    try {
      final response = await api.post(EndpointsStrings.changePassword, data: {
        'old_password': oldPassword,
        'password': password,
        'password_confirmation': passwordConfirmation,
      });
      final changePasswordResponse = PublicResponse.fromJson(response);
      return Right(changePasswordResponse);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
  
  @override
  Future<Either<ErrorModel, PublicResponse>> deleteAccount() async{
    try {
      final response = await api.post(EndpointsStrings.deleteAccount);
      final changePasswordResponse = PublicResponse.fromJson(response);
      return Right(changePasswordResponse);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
  
  @override
  Future<Either<ErrorModel, PublicResponse>> logOut() async{
    try {
      final response = await api.post(EndpointsStrings.logout);
      final changePasswordResponse = PublicResponse.fromJson(response);
      return Right(changePasswordResponse);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
}
