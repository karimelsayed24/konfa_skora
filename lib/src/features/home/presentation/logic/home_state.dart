import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/errors/error_model.dart';
import '../../data/model/banner_response.dart';
import '../../data/model/best_seller_response.dart';
import '../../data/model/daily_order_response.dart';

part 'home_state.freezed.dart';

// @freezed
// class HomeState with _$HomeState {
//   // Initial state
//   const factory HomeState.initial() = _Initial;
  
//   // Banner states
//   const factory HomeState.loadingBanner() = _LoadingBanner;
//   const factory HomeState.successBanner(BannerResponse response) = _SuccessBanner;
//   const factory HomeState.errorBanner(ErrorModel error) = _ErrorBanner;
  
//   // BestSeller states
//   const factory HomeState.loadingBestSeller() = _LoadingBestSeller;
//   const factory HomeState.successBestSeller(BestSellerResponse response) = _SuccessBestSeller;
//   const factory HomeState.errorBestSeller(ErrorModel error) = _ErrorBestSeller;
  
//   // DailyOrder states
//   const factory HomeState.loadingDailyOrder() = _LoadingDailyOrder;
//   const factory HomeState.successDailyOrder(DailyOrderResponse response) = _SuccessDailyOrder;
//   const factory HomeState.errorDailyOrder(ErrorModel error) = _ErrorDailyOrder;
// }
@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    // Banner state
    @Default(BannerState()) BannerState bannerState,
    
    // BestSeller state
    @Default(BestSellerState()) BestSellerState bestSellerState,
    
    // DailyOrder state
    @Default(DailyOrderState()) DailyOrderState dailyOrderState,
  }) = _HomeState;
  
  factory HomeState.initial() => const HomeState();
}

// حالة البانر
@freezed
class BannerState with _$BannerState {
  const factory BannerState({
    @Default(false) bool isLoading,
    BannerResponse? data,
    ErrorModel? error,
  }) = _BannerState;
}

// حالة الأكثر طلباً
@freezed
class BestSellerState with _$BestSellerState {
  const factory BestSellerState({
    @Default(false) bool isLoading,
    BestSellerResponse? data,
    ErrorModel? error,
  }) = _BestSellerState;
}

// حالة العروض اليومية
@freezed
class DailyOrderState with _$DailyOrderState {
  const factory DailyOrderState({
    @Default(false) bool isLoading,
    DailyOrderResponse? data,
    ErrorModel? error,
  }) = _DailyOrderState;
}
