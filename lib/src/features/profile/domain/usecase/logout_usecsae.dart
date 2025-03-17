

import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../../data/model/change_password_response.dart';
import '../repo/profile_repository.dart';

class LogoutUseCase {
  final ProfileRepository repository;

  LogoutUseCase(this.repository);

   Future<Either<ErrorModel, PublicResponse>> call() async {
    return await repository.logOut();
  }
}