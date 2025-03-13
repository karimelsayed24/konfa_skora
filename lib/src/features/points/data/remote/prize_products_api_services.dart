import 'package:dartz/dartz.dart';

import '../../../../../core/constants/endpoints_strings.dart';
import '../../../../../core/data/api/api_consumer.dart';
import '../../../../../core/errors/error_model.dart';
import '../../../../../core/errors/exceptions.dart';
import '../model/prize_products_response.dart';

abstract class PrizeProductsApiServices {
 Future<Either<ErrorModel, PrizeProductsResponse>> getPrizeProducts();
  Future<Either<ErrorModel, ExtraPointsOptionsResponse>> getExtraPointsOptions();
  Future<Either<ErrorModel, UserPointsResponse>> getUserPoints();
  }

class PrizeProductsApiServicesImpl implements PrizeProductsApiServices {
  final ApiConsumer api;

  PrizeProductsApiServicesImpl(this.api);

  @override
  Future<Either<ErrorModel, PrizeProductsResponse>> getPrizeProducts() async {
    try {
      final response = await api.get(EndpointsStrings.getPrizeProducts);
      final prizeProductsResponse = PrizeProductsResponse.fromJson(response);
      return Right(prizeProductsResponse);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
  
  @override
  Future<Either<ErrorModel, ExtraPointsOptionsResponse>> getExtraPointsOptions() async {
    try {
      final response = await api.get(EndpointsStrings.getExtraPointsOptions);
      final extraPointsOptionsResponse = ExtraPointsOptionsResponse.fromJson(response);
      return Right(extraPointsOptionsResponse);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
  
  @override
  Future<Either<ErrorModel, UserPointsResponse>> getUserPoints() async {
    try {
      final response = await api.get(EndpointsStrings.getUserPoints);
      final userPointsResponse = UserPointsResponse.fromJson(response);
      return Right(userPointsResponse);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
}