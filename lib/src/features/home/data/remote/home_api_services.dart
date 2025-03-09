import 'package:dartz/dartz.dart';

import '../../../../../core/constants/endpoints_strings.dart';
import '../../../../../core/data/api/api_consumer.dart';
import '../../../../../core/errors/error_model.dart';
import '../../../../../core/errors/exceptions.dart';
import '../model/banner_response.dart';
import '../model/best_seller_response.dart';
import '../model/daily_order_response.dart';

abstract class HomeApiServices {
  Future<Either<ErrorModel, BannerResponse>> getBanner();
  Future<Either<ErrorModel, DailyOrderResponse>> getDailyOrder();
  Future<Either<ErrorModel, BestSellerResponse>> getBestSeller();
}

class HomeApiServicesImpl extends HomeApiServices {
  final ApiConsumer api;
  HomeApiServicesImpl(this.api);
  @override
  Future<Either<ErrorModel, BannerResponse>> getBanner() async {
    try {
      final response = await api.get(EndpointsStrings.banners);
      final bannerResponse = BannerResponse.fromJson(response);
      return Right(bannerResponse);
    }  on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
  
  @override
  Future<Either<ErrorModel, BestSellerResponse>> getBestSeller() async {
    try {
      final response = await api.get(EndpointsStrings.bestSeller);
      final bestSellerResponse = BestSellerResponse.fromJson(response);
      return Right(bestSellerResponse);
    }  on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
  
  @override
  Future<Either<ErrorModel, DailyOrderResponse>> getDailyOrder() async {
    try {
      final response = await api.get(EndpointsStrings.dailyOrder);
      final dailyOrderResponse = DailyOrderResponse.fromJson(response);
      return Right(dailyOrderResponse);
    }  on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }


}
  

