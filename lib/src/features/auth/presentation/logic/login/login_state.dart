
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/errors/error_model.dart';
import '../../../data/model/login_response.dart';

part 'login_state.freezed.dart';
@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.success(LoginResponse response) = _Success;
  const factory LoginState.error(ErrorModel error) = _Error;
}