
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecase/resend_code_use_case.dart';
import '../../../domain/usecase/verify_email_use_case.dart';
import 'verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  final VerifyEmailUseCase verifyEmailUseCase;
  final ResendCodeUseCase resendCodeUseCase;
  
  VerificationCubit(this.verifyEmailUseCase, this.resendCodeUseCase) : super(const VerificationState.initial());
  
  Future<void> verifyEmail(String phone, String otp) async {
    emit(const VerificationState.loading());
    final result = await verifyEmailUseCase.execute(phone, otp);
    
    result.fold(
      (error) => emit(VerificationState.verificationError(error)),
      (response) => emit(VerificationState.verificationSuccess(response))
    );
  }
  
  Future<void> resendCode(String phone) async {
    emit(const VerificationState.loading());
    final result = await resendCodeUseCase.execute(phone);
    
    result.fold(
      (error) => emit(VerificationState.resendCodeError(error)),
      (message) => emit(VerificationState.resendCodeSuccess(message))
    );
  }
}