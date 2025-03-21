import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../../data/model/login_response.dart';
import '../repository/auth_repo.dart';

class SetLocationUseCase {
  final AuthRepo repository;

  SetLocationUseCase(this.repository);

  Future<Either<ErrorModel, LoginResponse>> setLocation(String mapDesc, double lat, double lng) async {
    return await repository.setLocation(mapDesc, lat, lng);
  }
}