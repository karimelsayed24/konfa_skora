
import 'package:dartz/dartz.dart';
import 'package:konaf_skora/src/features/auth/data/model/user_request.dart';

import '../../../../../core/errors/error_model.dart';
import '../../data/model/login_response.dart';
import '../repository/auth_repo.dart';

class RegisterUseCase {
  final AuthRepo _authRepository;
  RegisterUseCase(this._authRepository);
  Future<Either<ErrorModel, LoginResponse>> execute(
     UserRequest userRequest) async {
    return await _authRepository.register(userRequest);
  }
}
