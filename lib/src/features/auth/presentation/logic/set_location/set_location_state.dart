import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:konaf_skora/src/features/auth/data/model/login_response.dart';

import '../../../../../../core/errors/error_model.dart';

part 'set_location_state.freezed.dart';
@freezed
class SetLocationState with _$SetLocationState {
  const factory SetLocationState.initial() = _Initial;
  const factory SetLocationState.loading() = _Loading;
  const factory SetLocationState.loaded(LoginResponse response) = _Loaded;
  const factory SetLocationState.error(ErrorModel error) = _Error;
}