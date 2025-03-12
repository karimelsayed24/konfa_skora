import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../data/model/cart_response_model.dart';
import '../logic/cart_cubit.dart';

class PriceAndAddOrRemoveItemRow extends StatelessWidget {
  const PriceAndAddOrRemoveItemRow({
    super.key, required this.item, required this.currency,
  });
final CartItem item;
final String currency;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text.rich(
          TextSpan(
            text: " ${item.price} $currency",
            style: AppStyles.s20.copyWith(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
            ),
            children: const [
              TextSpan(
                text: AppStrings.totally,
                style: TextStyle(
                  color: AppColors.secondGrey,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        Row(
          children: [
            buildCircularButton(
              Icons.add,
              () => context
                  .read<CartCubit>()
                  .updateCartItemQuantity(
                    item.id,
                    item.quantity + 1,
                    item.isFree == true ? 1 : 0,
                  ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                '${item.quantity}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            buildCircularButton(
              Icons.remove,
              () {
                if (item.quantity > 1) {
                  context
                      .read<CartCubit>()
                      .updateCartItemQuantity(
                        item.id,
                        item.quantity - 1,
                        item.isFree == true ? 1 : 0,
                      );
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}


  Widget buildCircularButton(IconData icon, VoidCallback onPressed) {
    return Container(
      width: 20.w,
      height: 20.h,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primaryColor,
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(
          icon,
          color: Colors.white,
          size: 16,
        ),
        onPressed: onPressed,
      ),
    );
  }
