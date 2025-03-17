
import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../../../profile/data/model/change_password_response.dart';
import '../../data/model/address_response.dart';
import '../repo/address_repo.dart';

class StoreAddressUseCase {
  final AddressRepo repository;

  StoreAddressUseCase(this.repository);

  Future<Either<ErrorModel, PublicResponse>> call({
    required String title,
    required String mapDesc,
    required double lat,
    required double lng,
  }) async {
    return await repository.storeAddress(title, mapDesc, lat, lng);
  }
}


class GetAllAddressUseCase {
  final AddressRepo repository;

  GetAllAddressUseCase(this.repository);

  Future<Either<ErrorModel, AddressResponse>> call() async {
    return await repository.getAllAddress();
  }
}


class DeleteAddressUseCase {
  final AddressRepo repository;

  DeleteAddressUseCase(this.repository);

  Future<Either<ErrorModel, PublicResponse>> call(int id) async {
    return await repository.deleteAddress(id);
  }
}