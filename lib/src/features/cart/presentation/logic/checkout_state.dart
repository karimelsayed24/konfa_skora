import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/errors/error_model.dart';
import '../../data/model/pay_response.dart';

part 'checkout_state.freezed.dart';

@freezed
class CheckOutState with _$CheckOutState {
  const factory CheckOutState.initial() = _Initial;
  const factory CheckOutState.loading() = _Loading;
  const factory CheckOutState.success(PayResponse response) = _Success;
  const factory CheckOutState.error(ErrorModel error) = _Error;
}