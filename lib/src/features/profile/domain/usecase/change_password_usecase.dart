import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../../data/model/change_password_response.dart';
import '../repo/profile_repository.dart';

class ChangePasswordUseCase {
  final ProfileRepository _repository;

  ChangePasswordUseCase(this._repository);
 Future<Either<ErrorModel, PublicResponse>> execute(
      String oldPassword, String password, String passwordConfirmation)async {
    return _repository.changePassword(oldPassword, password, passwordConfirmation);
}
}