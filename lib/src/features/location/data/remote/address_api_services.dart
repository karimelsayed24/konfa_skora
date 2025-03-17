import 'package:dartz/dartz.dart';

import '../../../../../core/constants/endpoints_strings.dart';
import '../../../../../core/data/api/api_consumer.dart';
import '../../../../../core/errors/error_model.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../profile/data/model/change_password_response.dart';
import '../model/address_response.dart';

abstract class AddressApiServices {
  Future<Either<ErrorModel, PublicResponse>> storeAddress(
      String title, String mapDesc, double lat, double lng);
  Future<Either<ErrorModel, AddressResponse>> getAllAddress();
  Future<Either<ErrorModel, PublicResponse>> deleteAddress(int id);
}

class AddressApiServicesImpl implements AddressApiServices {
  final ApiConsumer api;

  AddressApiServicesImpl(this.api);
  @override
  Future<Either<ErrorModel, PublicResponse>> deleteAddress(int id) async {
    try {
      final response =
          await api.delete(EndpointsStrings.deleteAddress + id.toString());
      final profileResponse = PublicResponse.fromJson(response);
      return Right(profileResponse);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, AddressResponse>> getAllAddress() async {
    try {
      final response = await api.get(EndpointsStrings.getAddresses);
      final addressResponse = AddressResponse.fromJson(response);
      return Right(addressResponse);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, PublicResponse>> storeAddress(
      String title, String mapDesc, double lat, double lng) async {
    try {
      final response = await api.post(EndpointsStrings.storeAddress, data: {
        'title': title,
        'map_desc': mapDesc,
        'lat': lat.toString(),
        'lng': lng.toString(),
      });
      final profileResponse = PublicResponse.fromJson(response);
      return Right(profileResponse);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
}
