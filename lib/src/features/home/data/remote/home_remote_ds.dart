import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../model/banner_response.dart';
import '../model/best_seller_response.dart';
import '../model/daily_order_response.dart';
import 'home_api_services.dart';

abstract class HomeRemoteDs {
  Future<Either<ErrorModel, BannerResponse>> getBanner();
    Future<Either<ErrorModel, DailyOrderResponse>> getDailyOrder();
  Future<Either<ErrorModel, BestSellerResponse>> getBestSeller();
    Future<Either<ErrorModel, bool>> addToFavorite(int productId);


}


class HomeRemoteDsImpl extends HomeRemoteDs {
  final HomeApiServices api;
  HomeRemoteDsImpl(this.api);
  @override
  Future<Either<ErrorModel, BannerResponse>> getBanner() async {
    return api.getBanner();
  }
  
  @override
  Future<Either<ErrorModel, BestSellerResponse>> getBestSeller() async {
    return api.getBestSeller();
  }
  
  @override
  Future<Either<ErrorModel, DailyOrderResponse>> getDailyOrder() async {
    return api.getDailyOrder();
  }
  
  @override
  Future<Either<ErrorModel, bool>> addToFavorite(int productId) async {
    return api.addToFavorite(productId);
  }
}