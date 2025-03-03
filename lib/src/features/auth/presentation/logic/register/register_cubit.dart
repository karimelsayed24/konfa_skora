
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/user_request.dart';
import '../../../domain/usecase/register_use_case.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase _registerUseCase;

  RegisterCubit(this._registerUseCase) : super(const RegisterState.initial());

  Future<void> register(UserRequest userRequest) async {
    emit(const RegisterState.loading());
    final result = await _registerUseCase.execute(userRequest);
    result.fold(
      (error) => emit(RegisterState.error(error)),
      (response) => emit(RegisterState.success(response)),
    );
  }
}
