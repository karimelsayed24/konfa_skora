import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../../data/model/cart_response_model.dart';
import '../../data/remote/cart_remote_ds.dart';

abstract class CartRepository {
  Future<Either<ErrorModel, CartResponse>> getCartItems();
  Future<Either<ErrorModel, CartResponse>> addToCart(
      int productId, int quantity, int isFree);
  Future<Either<ErrorModel, CartResponse>> deleteCart(int cartItemId);
  Future<Either<ErrorModel, CartResponse>> updateCart(
      int cartItemId, int quantity, int isFree);

}

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDs remote;

  CartRepositoryImpl(this.remote);
  
  @override
  Future<Either<ErrorModel, CartResponse>> addToCart(int productId, int quantity, int isFree) async {
    return remote.addToCart(productId, quantity, isFree);
  }
  
  @override
  Future<Either<ErrorModel, CartResponse>> deleteCart(int cartItemId) async {
    return remote.deleteCart(cartItemId);
  }
  
  @override
  Future<Either<ErrorModel, CartResponse>> getCartItems() async {
    return remote.getCartItems();
  }
  
  @override
  Future<Either<ErrorModel, CartResponse>> updateCart(int cartItemId, int quantity, int isFree) async {
    return remote.updateCart(cartItemId, quantity, isFree);
  }
}