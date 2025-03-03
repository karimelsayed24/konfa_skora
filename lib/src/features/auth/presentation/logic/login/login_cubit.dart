import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/login_use_case.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  LoginCubit(this._loginUseCase) : super(const LoginState.initial());

  Future<void> login(String phone, String password) async {
    emit(const LoginState.loading());
    final result = await _loginUseCase.execute(phone, password);
    result.fold(
      (error) => emit(LoginState.error(error)),
      (response) => emit(LoginState.success(response)),
    );
  }
}