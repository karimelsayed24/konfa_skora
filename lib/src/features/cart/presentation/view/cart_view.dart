import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../components/cart_components.dart';


class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: const Text(
          'السلة',
          style: TextStyle(color: AppColors.primaryColor),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: const CartComponents(),
    );
  }
}
