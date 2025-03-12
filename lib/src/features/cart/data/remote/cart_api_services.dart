import 'package:dartz/dartz.dart';

import '../../../../../core/constants/endpoints_strings.dart';
import '../../../../../core/data/api/api_consumer.dart';
import '../../../../../core/errors/error_model.dart';
import '../../../../../core/errors/exceptions.dart';
import '../model/cart_response_model.dart';

abstract class CartApiServices {
  Future<Either<ErrorModel, CartResponse>> getCartItems();
  Future<Either<ErrorModel, CartResponse>> addToCart(
      int productId, int quantity, int isFree);
  Future<Either<ErrorModel, CartResponse>> deleteCart(int cartItemId);
  Future<Either<ErrorModel, CartResponse>> updateCart(
      int cartItemId, int quantity, int isFree);
}

class CartApiServicesImpl implements CartApiServices {
  final ApiConsumer api;

  CartApiServicesImpl(this.api);

  @override
  Future<Either<ErrorModel, CartResponse>> getCartItems() async {
    try {
      final response = await api.get(EndpointsStrings.getCart);
      final cartResponse = CartResponse.fromJson(response);
      return Right(cartResponse);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, CartResponse>> addToCart(
      int productId, int quantity, int isFree) async {
    try {
      final response = await api.post(
        EndpointsStrings.addToCart,
        data: {
          'product_id': productId,
          'quantity': quantity,
          'is_free': isFree
        },
      );
      final cartResponse = CartResponse.fromJson(response);
      return Right(cartResponse);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, CartResponse>> deleteCart(int cartId) async {
    try {
      final response = await api
          .post(EndpointsStrings.deleteFromCart, data: {'cart_id': cartId});
      final cartResponse = CartResponse.fromJson(response);
      return Right(cartResponse);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, CartResponse>> updateCart(
      int cartId, int quantity, int isFree) async {
    try {
      final response = await api.post(
        EndpointsStrings.updateCart,
        data: {'cart_id': cartId, 'quantity': quantity, 'is_free': isFree},
      );
      final cartResponse = CartResponse.fromJson(response);
      return Right(cartResponse);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
}
