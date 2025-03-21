import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../../data/model/login_response.dart';
import '../../data/model/user_request.dart';
import '../../data/remote/auth_remote_ds.dart';

abstract class AuthRepo {

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

class AuthRepoImpl extends AuthRepo {
  final AuthRemoteDs remoteDs;
  AuthRepoImpl(this.remoteDs);
  
  @override
  Future<Either<ErrorModel, LoginResponse>> login(String phone, String password) async{
    return await remoteDs.login(phone, password);
  }
  
  @override
  Future<Either<ErrorModel, LoginResponse>> register(UserRequest userRequest) async{
    return remoteDs.register(userRequest);
  }
  
  @override
  Future<Either<ErrorModel, String>> resendCode(String phone) async{
    return await remoteDs.resendCode(phone);
  }
  
  @override
  Future<Either<ErrorModel, LoginResponse>> verifyEmail(String phone, String otp) async{
    return await remoteDs.verifyEmail(phone, otp);
  }
  
  @override
  Future<Either<ErrorModel, LoginResponse>> setLocation(String mapDesc, double lat, double lng) async{
    return await remoteDs.setLocation(mapDesc, lat, lng);
  }
  
  @override
  Future<Either<ErrorModel, String>> forgetPassword(String email) async{
    return await remoteDs.forgetPassword(email);
  }
  
  @override
  Future<Either<ErrorModel, String>> resetPassword(String email, String otp, String password, String confirmPassword) async{
    return await remoteDs.resetPassword(email, otp, password, confirmPassword);
  }
  
  @override
  Future<Either<ErrorModel, String>> verifyForgetPassword(String email, String otp) async{
    return await remoteDs.verifyForgetPassword(email, otp);
  }

  
}
