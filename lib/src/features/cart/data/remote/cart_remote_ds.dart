import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../model/cart_response_model.dart';
import '../model/pay_response.dart';
import 'cart_api_services.dart';

abstract class CartRemoteDs {

 Future<Either<ErrorModel, CartResponse>> getCartItems();
  Future<Either<ErrorModel, CartResponse>> addToCart(
      int productId, int quantity, int isFree);
  Future<Either<ErrorModel, CartResponse>> deleteCart(int cartItemId);
  Future<Either<ErrorModel, CartResponse>> updateCart(
      int cartItemId, int quantity, int isFree);
  Future<Either<ErrorModel, PayResponse>> checkOut(int addressId, int payType);

}

class CartRemoteDsImpl implements CartRemoteDs{
  final  CartApiServices api;
  const CartRemoteDsImpl(this.api);
  @override
  Future<Either<ErrorModel, CartResponse>> addToCart(int productId, int quantity, int isFree) async {
    return api.addToCart(productId, quantity, isFree);
  }

  @override
  Future<Either<ErrorModel, CartResponse>> deleteCart(int cartItemId) async {
    return api.deleteCart(cartItemId);
  }

  @override
  Future<Either<ErrorModel, CartResponse>> getCartItems() async {
    return api.getCartItems();
  }

  @override
  Future<Either<ErrorModel, CartResponse>> updateCart(int cartItemId, int quantity, int isFree) async {
    return api.updateCart(cartItemId, quantity, isFree);
  }
  
  @override
  Future<Either<ErrorModel, PayResponse>> checkOut(int addressId, int payType)async {
    return api.checkOut(addressId ,payType);
  }

}