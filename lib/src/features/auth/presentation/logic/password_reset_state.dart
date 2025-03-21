import 'package:freezed_annotation/freezed_annotation.dart';

part 'password_reset_state.freezed.dart';

@freezed
class PasswordResetState with _$PasswordResetState {
  const factory PasswordResetState.initial() = _Initial;
  const factory PasswordResetState.loading() = _Loading;
  const factory PasswordResetState.forgetPasswordSuccess(String message) = _ForgetPasswordSuccess;
  const factory PasswordResetState.verifyOtpSuccess(String message) = _VerifyOtpSuccess;
  const factory PasswordResetState.resetPasswordSuccess(String message) = _ResetPasswordSuccess;
  const factory PasswordResetState.error(String message) = _Error;
}