import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../../data/model/prize_products_response.dart';
import '../repo/prize_products_repository.dart';

class GetPrizeProductsUseCase {
  final PrizeProductsRepository repository;

  GetPrizeProductsUseCase(this.repository);

  Future<Either<ErrorModel, PrizeProductsResponse>> call() async {
    return await repository.getPrizeProducts();
  }
}

class GetExtraPointsOptionsUseCase {
  final PrizeProductsRepository repository;

  GetExtraPointsOptionsUseCase(this.repository);

  Future<Either<ErrorModel, ExtraPointsOptionsResponse>> call() async {
    return await repository.getExtraPointsOptions();
  }
}

class GetUserPointsUseCase {
  final PrizeProductsRepository repository;

  GetUserPointsUseCase(this.repository);

  Future<Either<ErrorModel, UserPointsResponse>> call() async {
    return await repository.getUserPoints();
  }
}