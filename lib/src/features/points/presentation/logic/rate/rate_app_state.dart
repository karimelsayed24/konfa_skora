import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/model/rate_app_response.dart';

part 'rate_app_state.freezed.dart';

@freezed
class RateAppState with _$RateAppState {
  const factory RateAppState.initial() = _Initial;
  const factory RateAppState.loading() = _Loading;
  const factory RateAppState.success(RateAppResponse response) = _Success;
  const factory RateAppState.error(String message) = _Error;
}