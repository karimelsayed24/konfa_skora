import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/rate_app_usecase.dart';
import 'rate_app_state.dart';

class RateAppCubit extends Cubit<RateAppState> {
  final RateAppUseCase _rateAppUseCase;

  RateAppCubit(this._rateAppUseCase)
      : super(const RateAppState.initial());

  Future<void> rateApp() async {
    emit(const RateAppState.loading());

    final result = await _rateAppUseCase.rate();
    result.fold((error) => emit(RateAppState.error(error.message)),
        (response) {
      emit(RateAppState.success(response));
    });
  }
}
