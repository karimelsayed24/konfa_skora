import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../repository/auth_repo.dart';

class ForgetPasswordUseCase {
  final AuthRepo _authRepository;
  ForgetPasswordUseCase(this._authRepository);

  Future<Either<ErrorModel, String>> execute(String email) async {
    return await _authRepository.forgetPassword(email);
  }
}


class VerifyForgetPasswordUseCase {
  final AuthRepo _authRepository;
  VerifyForgetPasswordUseCase(this._authRepository);

  Future<Either<ErrorModel, String>> execute(String email, String otp) async {
    return await _authRepository.verifyForgetPassword(email, otp);
  }
}



  class ResetPasswordUseCase {
  final AuthRepo _authRepository;
  ResetPasswordUseCase(this._authRepository);

  Future<Either<ErrorModel, String>> execute(String email, String otp, String password, String confirmPassword) async {
    return await _authRepository.resetPassword(email, otp, password, confirmPassword);
  }
  }