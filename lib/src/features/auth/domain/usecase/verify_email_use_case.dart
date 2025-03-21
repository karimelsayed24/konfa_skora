import 'package:dartz/dartz.dart';
import 'package:konaf_skora/src/features/auth/data/model/login_response.dart';

import '../../../../../core/errors/error_model.dart';
import '../repository/auth_repo.dart';

class VerifyEmailUseCase {

  final AuthRepo _authRepository;

  VerifyEmailUseCase(this._authRepository);

  Future<Either<ErrorModel, LoginResponse>> execute(String phone, String otp) async {
    return _authRepository.verifyEmail(phone, otp);
  }
}