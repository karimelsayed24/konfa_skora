import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/model/best_seller_response.dart';

part 'best_seller_state.freezed.dart';

@freezed
class BestSellerState with _$BestSellerState {
  const factory BestSellerState.initial() = _Initial;
  const factory BestSellerState.loading() = _Loading;
  const factory BestSellerState.loaded(    BestSellerResponse data ) = _Loaded;
  const factory BestSellerState.error(String message) = _Error;
}