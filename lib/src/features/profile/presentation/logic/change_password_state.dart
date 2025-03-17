import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/change_password_response.dart';

part 'change_password_state.freezed.dart';
@freezed
class ChangePasswordState with _$ChangePasswordState {
  const factory ChangePasswordState.initial() = _Initial;
  const factory ChangePasswordState.loading() = _Loading;
  const factory ChangePasswordState.success(PublicResponse response) = _Success;
  const factory ChangePasswordState.error(String message) = _Error;
}