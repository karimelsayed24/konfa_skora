import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/errors/error_model.dart';
import '../../../data/model/login_response.dart';

part 'verification_state.freezed.dart';

@freezed
class VerificationState with _$VerificationState {
  const factory VerificationState.initial() = _Initial;
  const factory VerificationState.loading() = _Loading;
  const factory VerificationState.verificationSuccess(LoginResponse response) = _VerificationSuccess;
  const factory VerificationState.verificationError(ErrorModel error) = _VerificationError;
  const factory VerificationState.resendCodeSuccess(String message) = _ResendCodeSuccess;
  const factory VerificationState.resendCodeError(ErrorModel error) = _ResendCodeError;
}