import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/widgets/custom_btn.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../my_orders/presentation/widgets/image_column.dart';
import '../../data/model/cart_response_model.dart';
import '../widgets/build_order_summary.dart';
import '../widgets/price_and_add_or_remove_item_row.dart';
import '../widgets/title_and_delete_cart.dart';


class BuildCartContent extends StatelessWidget {
  const BuildCartContent({super.key, required this.cartData});
  final CartData cartData;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: cartData.cartItems.length,
            itemBuilder: (context, index) {
              return buildCartItem(
                  context, cartData.cartItems[index], cartData.currency);
            },
          ),
        ),
        BuildOrderSummary(
            prices: cartData.cartPrices, currency: cartData.currency),
        buildCheckoutButton(context),
      ],
    );
  }

  Widget buildCartItem(BuildContext context, CartItem item, String currency) {
    return Container(
      height: 147.h,
      margin: EdgeInsets.symmetric(horizontal: 7.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: AppColors.lightGrey, width: 2.w),
      ),
      child: Padding(
        padding: EdgeInsets.all(11.r),
        child: Row(
          children: [
            ImageColumn(
              image: item.productImage,
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleAndDeleteCart(
                    productName: item.productName,
                    productId: item.id,
                  ),
                  PriceAndAddOrRemoveItemRow(item: item, currency: currency),
                ],
              ),
            ),
            // Quantity controls
          ],
        ),
      ),
    );
  }

  Widget buildCheckoutButton(BuildContext context) {
    return CustomButton(
      onPressed: () {},
      text: AppStrings.goToPay,
    );
  }
}
