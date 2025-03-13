
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/prize_products_response.dart';

part 'prize_products_state.freezed.dart';

@freezed
class PrizeProductsState with _$PrizeProductsState {
  const factory PrizeProductsState.initial() = _Initial;
  const factory PrizeProductsState.loading() = _Loading;
  const factory PrizeProductsState.loaded({
    required PrizeProductsResponse prizeProductsResponse,
    required ExtraPointsOptionsResponse extraPointsOptionsResponse,
    required UserPointsResponse userPointsResponse,
  }) = _Loaded;
  const factory PrizeProductsState.error({required String message}) = _Error;
}
