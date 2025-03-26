import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/cart_use_case.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final GetCartItemsUseCase getCartItemsUseCase;
  final AddToCartUseCase addToCartUseCase;
  final RemoveFromCartUseCase removeFromCartUseCase;
  final UpdateCartItemQuantityUseCase updateCartItemQuantityUseCase;

  CartCubit(
    this.getCartItemsUseCase,
    this.addToCartUseCase,
    this.removeFromCartUseCase,
    this.updateCartItemQuantityUseCase,
  ) : super(const CartState.initial());

  Future<void> getCartItems() async {
    emit(const CartState.loading());
    final result = await getCartItemsUseCase.call();
    result.fold(
      (error) => emit(CartState.error(error.message)),
      (response) => emit(CartState.loaded(response)),
    );
  }

  Future<void> addToCart(
   {required int productId,
  required  int quantity,
    required int isFree,
   }
  ) async {
    emit(const CartState.loading());
    final result = await addToCartUseCase.call(productId, quantity, isFree);
    result.fold(
      (error) => emit(CartState.error(error.message)),
      (response) => emit(CartState.loaded(response)),
    );
  }

  Future<void> removeFromCart(int cartItemId) async {
    emit(const CartState.loading());
    final result = await removeFromCartUseCase.call(cartItemId);
    result.fold(
      (error) => emit(CartState.error(error.message)),
      (response) => emit(CartState.loaded(response)),
    );
  }

  Future<void> updateCartItemQuantity(
    int productId,
    int quantity,
    int isFree,
  ) async {
    emit(const CartState.loading());
    final result =
        await updateCartItemQuantityUseCase.call(productId, quantity, isFree);
    result.fold(
      (error) => emit(CartState.error(error.message)),
      (response) => emit(CartState.loaded(response)),
    );
  }
}
