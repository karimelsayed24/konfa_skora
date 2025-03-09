import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../model/order_details.dart';
import '../model/order_response_model.dart';
import 'my_order_api_services.dart';

abstract class MyOrderRemoteDs {
  Future<Either<ErrorModel, MyOrdersResponse>> getMyOrders();
      Future<Either<ErrorModel, MyOrderDetailsResponse>> getOrderDetails(int orderId);

}


class MyOrderRemoteDsImpl extends MyOrderRemoteDs {
  final OrdersApiServices api;
  MyOrderRemoteDsImpl(this.api);
  @override
  Future<Either<ErrorModel, MyOrdersResponse>> getMyOrders() async {
    return api.getMyOrders();
  }
  
  @override
  Future<Either<ErrorModel, MyOrderDetailsResponse>> getOrderDetails(int orderId) async {
    return api.getOrderDetails(orderId);
  }
}