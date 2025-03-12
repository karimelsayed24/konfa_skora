import '../../domain/usecase/change_password_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final ChangePasswordUseCase _changePasswordUseCase;

  ChangePasswordCubit(this._changePasswordUseCase)
      : super(const ChangePasswordState.initial());

  Future<void> changePassword({
    required String oldPassword,
    required String password,
    required String passwordConfirmation,
  }) async {
    emit(const ChangePasswordState.loading());

    final result = await _changePasswordUseCase.execute(
      oldPassword,
      password,
      passwordConfirmation,
    );
    result.fold((error) => emit(ChangePasswordState.error(error.message)),
        (response) {
      emit(ChangePasswordState.success(response));
    });
  }
}
