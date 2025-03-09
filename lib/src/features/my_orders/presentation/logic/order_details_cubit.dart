import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/get_order_details_use_case.dart';
import 'order_details_state.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  final GetOrderDetailsUseCase getOrderDetailsUseCase;

  OrderDetailsCubit( this.getOrderDetailsUseCase) 
      : super(const OrderDetailsState.initial());

  Future<void> getOrderDetails(int orderId) async {
    emit(const OrderDetailsState.loading());
    
    final result = await getOrderDetailsUseCase(orderId);
    
    result.fold(
      (error) => emit(OrderDetailsState.error(error.message)),
      (response) => emit(OrderDetailsState.loaded(response.data)),
    );
  }
}