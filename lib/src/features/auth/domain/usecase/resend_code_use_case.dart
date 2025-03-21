import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../repository/auth_repo.dart';

class ResendCodeUseCase {
  final AuthRepo _authRepository;
  ResendCodeUseCase(this._authRepository);

  
  Future<Either<ErrorModel, String>> execute(String phone) async {
    return await _authRepository.resendCode(phone);
  }
}
