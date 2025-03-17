import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/check_out_use_case.dart';
import 'checkout_state.dart';

class CheckOutCubit extends Cubit<CheckOutState> {
  final CheckOutUseCase checkOutUseCase;

  CheckOutCubit( this.checkOutUseCase) : super(const CheckOutState.initial());

  Future<void> checkOut({required int addressId,required int payType}) async {
    emit(const CheckOutState.loading());
    final  result = await checkOutUseCase.call(addressId, payType);
    result.fold(
      (error) => emit(CheckOutState.error(error)),
      (response) => emit(CheckOutState.success(response)),
    );
  }
}