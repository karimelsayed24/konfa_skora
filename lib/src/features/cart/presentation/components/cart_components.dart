
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/cart_cubit.dart';
import '../logic/cart_state.dart';
import '../widgets/build_cart_content.dart';

class CartComponents extends StatelessWidget {
  const CartComponents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return state.when(
          initial: () {
            context.read<CartCubit>().getCartItems();
            return const Center(child: CircularProgressIndicator());
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (cartData) => BuildCartContent(cartData: cartData.data),
          error: (message) => Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}
