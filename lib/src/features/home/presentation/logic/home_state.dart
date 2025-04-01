import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/errors/error_model.dart';
import '../../data/model/banner_response.dart';
import '../../data/model/best_seller_response.dart';
import '../../data/model/daily_order_response.dart';

part 'home_state.freezed.dart';


@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(BannerState()) BannerState bannerState,
    
    // @Default(BestSellerState()) BestSellerState bestSellerState,
    
    @Default(DailyOrderState()) DailyOrderState dailyOrderState,
  }) = _HomeState;
  
  factory HomeState.initial() => const HomeState();
}


@freezed
class BannerState with _$BannerState {
  const factory BannerState({
    @Default(false) bool isLoading,
    BannerResponse? data,
    ErrorModel? error,
  }) = _BannerState;
}

// @freezed
// class BestSellerState with _$BestSellerState {
//   const factory BestSellerState({
//     @Default(false) bool isLoading,
//     BestSellerResponse? data,
//     ErrorModel? error,
//   }) = _BestSellerState;
// }

@freezed
class DailyOrderState with _$DailyOrderState {
  const factory DailyOrderState({
    @Default(false) bool isLoading,
    DailyOrderResponse? data,
    ErrorModel? error,
  }) = _DailyOrderState;
}
