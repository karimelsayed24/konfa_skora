import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../model/login_response.dart';
import '../model/user_request.dart';
import 'auth_api_services.dart';

abstract class AuthRemoteDs {
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

class AuthRemoteDsImpl extends AuthRemoteDs {
  final AuthApiServices apiServices;
  AuthRemoteDsImpl(this.apiServices);
  
  @override
  Future<Either<ErrorModel, LoginResponse>> login(String phone, String password) async{
    return await apiServices.login(phone, password);
  }
  
  @override
  Future<Either<ErrorModel, LoginResponse>> register(userRequest) async{
    return apiServices.register(userRequest);
  }
  
  @override
  Future<Either<ErrorModel, String>> resendCode(String phone)async {
    return await apiServices.resendCode(phone);
  }
  
  @override
  Future<Either<ErrorModel, LoginResponse>> verifyEmail(String phone, String otp) async{
    return await apiServices.verifyEmail(phone, otp);
  }
  
  @override
  Future<Either<ErrorModel, LoginResponse>> setLocation(String mapDesc, double lat, double lng) async{
    return await apiServices.setLocation(mapDesc, lat, lng);
  }
  
  @override
  Future<Either<ErrorModel, String>> forgetPassword(String email) async{
    return await apiServices.forgetPassword(email);
  }
  
  @override
  Future<Either<ErrorModel, String>> resetPassword(String email, String otp, String password, String confirmPassword)async {
    return await apiServices.resetPassword(email, otp, password, confirmPassword);
  }
  
  @override
  Future<Either<ErrorModel, String>> verifyForgetPassword(String email, String otp) async{
    return await apiServices.verifyForgetPassword(email, otp);
  }


}
