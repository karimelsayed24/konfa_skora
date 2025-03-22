import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../../data/model/banner_response.dart';
import '../../data/model/best_seller_response.dart';
import '../../data/model/daily_order_response.dart';
import '../../data/remote/home_remote_ds.dart';

abstract class HomeRepo {
  Future<Either<ErrorModel, BannerResponse>> getBanner();
    Future<Either<ErrorModel, DailyOrderResponse>> getDailyOrder();
  Future<Either<ErrorModel, BestSellerResponse>> getBestSeller();
    Future<Either<ErrorModel, bool>> addToFavorite(int productId);


}


class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDs remoteDs;
  HomeRepoImpl(this.remoteDs);
  @override
  Future<Either<ErrorModel, BannerResponse>> getBanner() async {
    return remoteDs.getBanner();
  }
  
  @override
  Future<Either<ErrorModel, BestSellerResponse>> getBestSeller()async {
    return remoteDs.getBestSeller();
  }
  
  @override
  Future<Either<ErrorModel, DailyOrderResponse>> getDailyOrder() async {
    return remoteDs.getDailyOrder();
  }
  
  @override
  Future<Either<ErrorModel, bool>> addToFavorite(int productId) async {
    return remoteDs.addToFavorite(productId);
  }
}