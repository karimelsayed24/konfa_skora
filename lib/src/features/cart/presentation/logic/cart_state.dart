import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/cart_response_model.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;
  const factory CartState.loading() = _Loading;
  const factory CartState.loaded( CartResponse cartData) = _Loaded;
  const factory CartState.error(String message) = _Error;
}