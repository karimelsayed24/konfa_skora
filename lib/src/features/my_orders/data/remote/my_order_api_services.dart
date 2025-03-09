import 'package:dartz/dartz.dart';

import '../../../../../core/constants/endpoints_strings.dart';
import '../../../../../core/data/api/api_consumer.dart';
import '../../../../../core/errors/error_model.dart';
import '../../../../../core/errors/exceptions.dart';
import '../model/order_details.dart';
import '../model/order_response_model.dart';

abstract class OrdersApiServices {
  Future<Either<ErrorModel, MyOrdersResponse>> getMyOrders();
    Future<Either<ErrorModel, MyOrderDetailsResponse>> getOrderDetails(int orderId);

}

class OrdersApiServicesImpl implements OrdersApiServices {
  final ApiConsumer api;

  OrdersApiServicesImpl(this.api);

  @override
  Future<Either<ErrorModel, MyOrdersResponse>> getMyOrders() async {
    try {
      final response = await api.get(EndpointsStrings.getMyOrders);
      final ordersResponse = MyOrdersResponse.fromJson(response);
      return Right(ordersResponse);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
  
   @override
  Future<Either<ErrorModel, MyOrderDetailsResponse>> getOrderDetails(int orderId) async {
    try {
      final response = await api.get('${EndpointsStrings.getOrderDetails}/$orderId');
      final orderDetailsResponse = MyOrderDetailsResponse.fromJson(response);
      return Right(orderDetailsResponse);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
}
