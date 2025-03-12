import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/get_my_orders_usecase.dart';
import 'orders_states.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final GetMyOrdersUseCase getMyOrdersUseCase;

  OrdersCubit(this.getMyOrdersUseCase) : super(OrdersInitial());

  Future<void> getMyOrders() async {
    emit(OrdersLoading());
    
    final result = await getMyOrdersUseCase.call();
    
    result.fold(
      (error) => emit(OrdersError(error.message)),
      (orders) => emit(OrdersLoaded(orders)),
    );
  }
}