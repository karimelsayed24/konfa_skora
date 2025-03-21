import 'package:dartz/dartz.dart';
import 'package:konaf_skora/core/constants/endpoints_strings.dart';

import '../../../../../core/data/api/api_consumer.dart';
import '../../../../../core/data/cached/cache_helper.dart';
import '../../../../../core/errors/error_model.dart';
import '../../../../../core/errors/exceptions.dart';
import '../model/login_response.dart';
import '../model/user_request.dart';

abstract class AuthApiServices {
  Future<Either<ErrorModel, LoginResponse>> login(
      String phone, String password);
  Future<Either<ErrorModel, LoginResponse>> register(UserRequest userRequest);
   Future<Either<ErrorModel, LoginResponse>> verifyEmail(String phone, String otp);
  Future<Either<ErrorModel, String>> resendCode(String phone,);
 Future<Either<ErrorModel, LoginResponse>> setLocation(
       String mapDesc, double lat, double lng);

  Future<Either<ErrorModel, String>> forgetPassword(String email,);
   Future<Either<ErrorModel, String>> verifyForgetPassword(String email, String otp);
  Future<Either<ErrorModel, String>> resetPassword(String email, String otp, String password , String confirmPassword);
  
}

class AuthApiServicesImpl extends AuthApiServices {
  final ApiConsumer api;
  AuthApiServicesImpl(this.api);

  @override
  Future<Either<ErrorModel, LoginResponse>> login(
      String phone, String password) async {
    try {
      final response = await api.post(EndpointsStrings.login, data: {
        'phone': phone,
        'password': password,
      });
      final userResponse = LoginResponse.fromJson(response);
      CacheHelper.saveToken(value: userResponse.data.token);
      CacheHelper.saveData(
          key: 'name',
          value:
              '${userResponse.data.firstName}  ${userResponse.data.lastName}');
      // CacheHelper.saveData(
      //     key: 'image', value: userResponse.data.image.toString());
      return Right(userResponse);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, LoginResponse>> register(
      UserRequest userRequest) async {
    try {
      final response =
          await api.post(EndpointsStrings.register, data: userRequest.toJson());
      final userResponse = LoginResponse.fromJson(response);

      return Right(userResponse);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
  
  @override
  Future<Either<ErrorModel, LoginResponse>> verifyEmail(String phone, String otp) async{
    try {
      final response = await api.post(EndpointsStrings.verifyEmail, data: {
        'phone': phone,
        'code': otp,
      });
      final userResponse = LoginResponse.fromJson(response);
           CacheHelper.saveToken(value: userResponse.data.token);

      return Right(userResponse);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
  
  @override
  Future<Either<ErrorModel, String>> resendCode(String phone) async{
    try {
      final response = await api.post(EndpointsStrings.resendCode, data: {
        'phone': phone,
      });
      return Right(response['msg']);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
  
  @override
  Future<Either<ErrorModel, LoginResponse>> setLocation(String mapDesc, double lat, double lng) async{
    try {
      final response = await api.post(EndpointsStrings.setLocation, data: {
        'map_desc': mapDesc,
        'lat': lat.toString(),
        'lng': lng.toString(),
      });
      final userResponse = LoginResponse.fromJson(response);
      return Right(userResponse);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
  
  @override
  Future<Either<ErrorModel, String>> forgetPassword(String email) async{
    try {
      final response = await api.post(EndpointsStrings.forgetPassword, data: {
        'email': email,
      });
      return Right(response['msg']);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
   @override
  Future<Either<ErrorModel, String>> verifyForgetPassword(String email, String otp) async {
    try {
      final response = await api.post(EndpointsStrings.checkCode, data: {
        'email': email,
        'code': otp,
      });
      return Right(response['msg']);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
  
  
  @override
  Future<Either<ErrorModel, String>> resetPassword(String email, String otp, String password, String confirmPassword) async{
    try {
      final response = await api.post(EndpointsStrings.resetPassword, data: {
        'email': email,
        'code': otp,
        'password': password,
        'password_confirmation': confirmPassword,
      });
      return Right(response['msg']);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
  
 
}
