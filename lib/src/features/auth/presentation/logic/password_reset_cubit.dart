import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/forget_password_use_case.dart';
import 'password_reset_state.dart';

import 'package:shared_preferences/shared_preferences.dart';

class PasswordResetCubit extends Cubit<PasswordResetState> {
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  final VerifyForgetPasswordUseCase _verifyForgetPasswordUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;
  
  static const String _emailKey = 'password_reset_email';
  static const String _otpKey = 'password_reset_otp';

  PasswordResetCubit(
    this._forgetPasswordUseCase,
    this._verifyForgetPasswordUseCase,
    this._resetPasswordUseCase,
  ) : super(const PasswordResetState.initial()) {
    _loadStoredData();
  }

  Future<void> _saveEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_emailKey, email);
  }

  Future<void> _saveOtp(String otp) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_otpKey, otp);
  }

  Future<String?> _getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_emailKey);
  }

  Future<String?> _getOtp() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_otpKey);
  }

  Future<void> _clearData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_emailKey);
    await prefs.remove(_otpKey);
  }

  Future<void> _loadStoredData() async {
    final email = await _getEmail();
    final otp = await _getOtp();
    print('Loaded stored data - email: $email, otp: $otp');
  }

  static final Map<String, String> _persistentData = {};

  Future<void> forgetPassword(String email) async {
    emit(const PasswordResetState.loading());
    
    _persistentData[_emailKey] = email;
    await _saveEmail(email);
    
    print('---------------email: $email');
    final result = await _forgetPasswordUseCase.execute(email);
    
    result.fold(
      (error) => emit(PasswordResetState.error(error.message)),
      (message) => emit(PasswordResetState.forgetPasswordSuccess(message)),
    );
    
    print('---------------stored email: ${_persistentData[_emailKey]}');
  }

  Future<void> resendOtp() async {
    final email = _persistentData[_emailKey] ?? await _getEmail();
    if (email == null) {
      emit(const PasswordResetState.error("البريد الإلكتروني غير موجود. يرجى البدء من جديد."));
      return;
    }
    
    emit(const PasswordResetState.loading());
    
    final result = await _forgetPasswordUseCase.execute(email);
    
    result.fold(
      (error) => emit(PasswordResetState.error(error.message)),
      (message) => emit(PasswordResetState.forgetPasswordSuccess(message)),
    );
  }

  Future<void> verifyOtp(String otp) async {
    final email = _persistentData[_emailKey] ?? await _getEmail();
    print('---------------email: $email, otp: $otp');
    
    if (email == null) {
      emit(const PasswordResetState.error("البريد الإلكتروني غير موجود. يرجى البدء من جديد."));
      return;
    }
    
    emit(const PasswordResetState.loading());
    
    _persistentData[_otpKey] = otp;
    await _saveOtp(otp);
    
    final result = await _verifyForgetPasswordUseCase.execute(email, otp);
    
    result.fold(
      (error) => emit(PasswordResetState.error(error.message)),
      (message) => emit(PasswordResetState.verifyOtpSuccess(message)),
    );
  }

  Future<void> resetPassword(String password, String confirmPassword) async {
    final email = _persistentData[_emailKey] ?? await _getEmail();
    final otp = _persistentData[_otpKey] ?? await _getOtp();
    
    if (email == null || otp == null) {
      emit(const PasswordResetState.error("بيانات مفقودة. يرجى البدء من جديد."));
      return;
    }
    
    emit(const PasswordResetState.loading());
    
    final result = await _resetPasswordUseCase.execute(email, otp, password, confirmPassword);
    
    result.fold(
      (error) => emit(PasswordResetState.error(error.message)),
      (message) {
        emit(PasswordResetState.resetPasswordSuccess(message));
        _clearData(); 
        _persistentData.clear();
      },
    );
  }

  void reset() {
    _clearData();
    _persistentData.clear();
    emit(const PasswordResetState.initial());
  }
}