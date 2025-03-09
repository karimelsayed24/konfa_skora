import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../../data/model/order_details.dart';
import '../repo/my_order_repository.dart';

class GetOrderDetailsUseCase {
  final OrdersRepository repository;

  GetOrderDetailsUseCase(this.repository);

  Future<Either<ErrorModel, MyOrderDetailsResponse>> call(
      int orderId) async {
    return await repository.getOrderDetails(orderId);
  }
}
