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

  // Future<Either<ErrorModel, String>> forgetPassword(
  //     String userType, String identifier);

  // Future<Either<ErrorModel, String>> verifyResetCode(
  //     String userType, String otp, String identifier);
  // Future<Either<ErrorModel, String>> resetPassword(
  //     String userType, String otp, String password, String identifier);
  // Future<Either<ErrorModel, String>> verifyEmail(String userType, String otp);
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
// @override
//   Future<Either<ErrorModel, String>> verifyEmail(
//       String userType, String otp) async {
//     try {
//       final response = await api.post(endpoint, data: {'code': otp});
//       return Right(response['message']);
//     } on ServerException catch (e) {
//       return Left(e.errorModel);
//     }
//   }

//   @override
//   Future<Either<ErrorModel, String>> forgetPassword(
//       String userType, String identifier) async {
//     try {
//       final response =
//           await api.post(endpoint, data: {'identifier': identifier});
//       return Right(response['message']);
//     } on ServerException catch (e) {
//       return Left(e.errorModel);
//     }
//   }

//   @override
//   Future<Either<ErrorModel, String>> verifyResetCode(
//       String userType, String otp, String identifier) async {
//     try {
//       final response = await api
//           .post(endpoint, data: {'code': otp, 'identifier': identifier});
//       return Right(response['message']);
//     } on ServerException catch (e) {
//       return Left(e.errorModel);
//     }
//   }

//   @override
//   Future<Either<ErrorModel, String>> resetPassword(
//       String userType, String otp, String password, String identifier) async {
//     try {
//       final response = await api.post(endpoint,
//           data: {'code': otp, 'password': password, 'identifier': identifier});
//       return Right(response['message']);
//     } on ServerException catch (e) {
//       return Left(e.errorModel);
//     }
//   }
}
