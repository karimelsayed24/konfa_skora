
import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../../data/model/prize_products_response.dart';
import '../../data/remote/prize_products_remote_ds.dart';

abstract class PrizeProductsRepository {
  Future<Either<ErrorModel, PrizeProductsResponse>> getPrizeProducts();
    Future<Either<ErrorModel, ExtraPointsOptionsResponse>> getExtraPointsOptions();
  Future<Either<ErrorModel, UserPointsResponse>> getUserPoints();
}

class PrizeProductsRepositoryImpl implements PrizeProductsRepository {
  final PrizeProductsRemoteDs remoteDs;

  PrizeProductsRepositoryImpl(this.remoteDs);
  
  @override
  Future<Either<ErrorModel, ExtraPointsOptionsResponse>> getExtraPointsOptions() async {
    return remoteDs.getExtraPointsOptions();
  }
  
  @override
  Future<Either<ErrorModel, PrizeProductsResponse>> getPrizeProducts() async {
    return remoteDs.getPrizeProducts();
  }
  
  @override
  Future<Either<ErrorModel, UserPointsResponse>> getUserPoints() async {
    return remoteDs.getUserPoints();
  }

}