import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../model/prize_products_response.dart';
import 'prize_products_api_services.dart';

abstract class PrizeProductsRemoteDs {
    Future<Either<ErrorModel, PrizeProductsResponse>> getPrizeProducts();
    Future<Either<ErrorModel, ExtraPointsOptionsResponse>> getExtraPointsOptions();
  Future<Either<ErrorModel, UserPointsResponse>> getUserPoints();

}

class PrizeProductsRemoteDsImpl extends PrizeProductsRemoteDs {
    final PrizeProductsApiServices api;
    PrizeProductsRemoteDsImpl(this.api);
    @override
    Future<Either<ErrorModel, PrizeProductsResponse>> getPrizeProducts() async {
        return api.getPrizeProducts();
    }
    
      @override
      Future<Either<ErrorModel, ExtraPointsOptionsResponse>> getExtraPointsOptions() async {
        return api.getExtraPointsOptions();
      }
    
      @override
      Future<Either<ErrorModel, UserPointsResponse>> getUserPoints() async {
        return api.getUserPoints();
      }

    
}