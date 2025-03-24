import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/product_details_response.dart';

part 'product_details_state.freezed.dart';
@freezed
class ProductDetailsState with _$ProductDetailsState {
  const factory ProductDetailsState.initial() = _Initial;
  const factory ProductDetailsState.loading() = _Loading;
  const factory ProductDetailsState.loaded(ProductDetailsResponse productDetails) = _Loaded;
  const factory ProductDetailsState.error(String message) = _Error;
}