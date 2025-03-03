import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../../data/model/login_response.dart';
import '../repository/auth_repo.dart';

class LoginUseCase {
  final AuthRepo _authRepository;
  LoginUseCase(this._authRepository);
  Future<Either<ErrorModel, LoginResponse>> execute(
      String phone, String password) async {
    return await _authRepository.login(phone, password);
  }
}
