import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../../data/model/cart_response_model.dart';
import '../repo/cart_repository.dart';

class GetCartItemsUseCase {
  final CartRepository repository;

  GetCartItemsUseCase(this.repository);

  Future<Either<ErrorModel, CartResponse>> call() async {
    return await repository.getCartItems();
  }
}

class AddToCartUseCase {
  final CartRepository repository;

  AddToCartUseCase(this.repository);

  Future<Either<ErrorModel, CartResponse>> call(int productId, int quantity, int isFree) async {
    return await repository.addToCart(productId, quantity, isFree);
  }
}

class RemoveFromCartUseCase {
  final CartRepository repository;

  RemoveFromCartUseCase(this.repository);

  Future<Either<ErrorModel, CartResponse>> call(int cartItemId) async {
    return await repository.deleteCart(cartItemId);
  }
}

class UpdateCartItemQuantityUseCase {
  final CartRepository repository;

  UpdateCartItemQuantityUseCase(this.repository);

  Future<Either<ErrorModel, CartResponse>> call(int cartItemId, int quantity, int isFree) async {
    return await repository.updateCart( cartItemId,  quantity,  isFree);
  }
}