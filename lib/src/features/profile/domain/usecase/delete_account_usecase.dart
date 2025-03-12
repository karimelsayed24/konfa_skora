
import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../../data/model/change_password_response.dart';
import '../repo/profile_repository.dart';

class DeleteAccountUseCase {
  final ProfileRepository repository;

  DeleteAccountUseCase(this.repository);

   Future<Either<ErrorModel, ChangePasswordResponse>> call() async {
    return await repository.deleteAccount();
  }
}