import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../../data/model/order_details.dart';
import '../../data/model/order_response_model.dart';
import '../../data/remote/my_order_remote_ds.dart';

abstract class OrdersRepository {
  Future<Either<ErrorModel, MyOrdersResponse>> getMyOrders();
      Future<Either<ErrorModel, MyOrderDetailsResponse>> getOrderDetails(int orderId);

}

class OrdersRepositoryImpl implements OrdersRepository {
  final MyOrderRemoteDs remote;

  OrdersRepositoryImpl(this.remote);

  @override
  Future<Either<ErrorModel, MyOrdersResponse>> getMyOrders() async {
    return remote.getMyOrders();
  }
  
  @override
  Future<Either<ErrorModel, MyOrderDetailsResponse>> getOrderDetails(int orderId) async {
    return remote.getOrderDetails(orderId);
  }
}
