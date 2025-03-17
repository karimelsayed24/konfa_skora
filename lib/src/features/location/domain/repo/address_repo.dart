import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../../../profile/data/model/change_password_response.dart';
import '../../data/model/address_response.dart';
import '../../data/remote/address_remote_ds.dart';

abstract class AddressRepo {
   Future<Either<ErrorModel, PublicResponse>> storeAddress(
      String title, String mapDesc, double lat, double lng);
  Future<Either<ErrorModel, AddressResponse>> getAllAddress();
  Future<Either<ErrorModel, PublicResponse>> deleteAddress(int id);
}

class AddressRepoImpl implements AddressRepo {
  final AddressRemoteDs remote;
  AddressRepoImpl(this.remote);
  @override
  Future<Either<ErrorModel, PublicResponse>> deleteAddress(int id) async{
    return await remote.deleteAddress(id);
  }
  
  @override
  Future<Either<ErrorModel, AddressResponse>> getAllAddress() async{
    return await remote.getAllAddress();
  }
  
  @override
  Future<Either<ErrorModel, PublicResponse>> storeAddress(String title, String mapDesc, double lat, double lng) async{
    return await remote.storeAddress(title, mapDesc, lat, lng);
  }
}