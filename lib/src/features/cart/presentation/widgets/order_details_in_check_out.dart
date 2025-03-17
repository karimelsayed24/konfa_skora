import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../data/model/cart_response_model.dart';
import 'price_row.dart';

class OrderDetailsInCheckOut extends StatelessWidget {
  const OrderDetailsInCheckOut({
    super.key,
    required this.cartData,
  });
  final CartData cartData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.myOrderDetails,
          style: AppStyles.s20.copyWith(
            color: AppColors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 12),
        buildPriceRow(AppStrings.productsPrice,
            '${cartData.cartPrices.price} ${cartData.currency}'),
        buildPriceRow(AppStrings.deliveryCost,
            '${cartData.cartPrices.deliveryPrice} ${cartData.currency}'),
      ],
    );
  }
}
