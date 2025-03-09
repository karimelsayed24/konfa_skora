import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../../data/model/best_seller_response.dart';
import '../repo/home_repo.dart';

class GetBestSellerUC {
  final HomeRepo _homeRepo;
  GetBestSellerUC(this._homeRepo);

  Future<Either<ErrorModel, BestSellerResponse>> getBestSeller() async {
    return _homeRepo.getBestSeller();
  }
}
