import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../../../profile/data/model/change_password_response.dart';
import '../model/address_response.dart';
import 'address_api_services.dart';

abstract class AddressRemoteDs {
   Future<Either<ErrorModel, PublicResponse>> storeAddress(
      String title, String mapDesc, double lat, double lng);
  Future<Either<ErrorModel, AddressResponse>> getAllAddress();
  Future<Either<ErrorModel, PublicResponse>> deleteAddress(int id);
}

class AddressRemoteDsImpl implements AddressRemoteDs {
  final AddressApiServices api;
  AddressRemoteDsImpl(this.api);
  @override
  Future<Either<ErrorModel, PublicResponse>> deleteAddress(int id) async{
    return await api.deleteAddress(id);
  }
  
  @override
  Future<Either<ErrorModel, AddressResponse>> getAllAddress() async{
    return await api.getAllAddress();
  }
  
  @override
  Future<Either<ErrorModel, PublicResponse>> storeAddress(String title, String mapDesc, double lat, double lng) async{
    return await api.storeAddress(title, mapDesc, lat, lng);
  }
}