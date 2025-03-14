import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../../data/model/rate_app_response.dart';
import '../repo/prize_products_repository.dart';

class RateAppUseCase {
  final PrizeProductsRepository repo;
  const RateAppUseCase(this.repo);

 Future<Either<ErrorModel, RateAppResponse>> rate () async {
   return repo.rateApp();
 }
  
}