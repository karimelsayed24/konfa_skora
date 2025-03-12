
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../logic/cart_cubit.dart';

class TitleAndDeleteCart extends StatelessWidget {
  const TitleAndDeleteCart({
    super.key, required this.productName, required this.productId,
  });
final String productName;
final int productId;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(productName,
            style: AppStyles.s20.copyWith(
              color: AppColors.iconColor,
              fontWeight: FontWeight.w500,
            )),
        IconButton(
          icon: const Icon(
            Icons.delete_outline_outlined,
            color: AppColors.red,
          ),
          onPressed: () {
            context.read<CartCubit>().removeFromCart(productId);
          },
        ),
      ],
    );
  }
}
