import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../../data/model/order_response_model.dart';
import '../repo/my_order_repository.dart';

class GetMyOrdersUseCase {
  final OrdersRepository repository;

  GetMyOrdersUseCase(this.repository);

  Future<Either<ErrorModel, MyOrdersResponse>>  call() async {
    return await repository.getMyOrders();
  }
}