import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/order_details.dart';

part 'order_details_state.freezed.dart';

@freezed
class OrderDetailsState with _$OrderDetailsState {
  const factory OrderDetailsState.initial() = _Initial;
  const factory OrderDetailsState.loading() = _Loading;
  const factory OrderDetailsState.loaded(OrderDetailsData orderDetails) =
      _Loaded;
  const factory OrderDetailsState.error(String message) = _Error;
}
