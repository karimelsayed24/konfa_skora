
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../data/model/cart_response_model.dart';

class BuildOrderSummary extends StatelessWidget {
  const BuildOrderSummary(
      {super.key, required this.prices, required this.currency});
  final CartPrices prices;
  final String currency;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 7.w, vertical: 10.h),
      padding: EdgeInsets.all(11.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: AppColors.lightGrey, width: 2.w),
      ),
      child: Column(
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
          _buildPriceRow(
              AppStrings.productsPrice, '${prices.price} $currency'),
          _buildPriceRow(
              AppStrings.deliveryCost, '${prices.deliveryPrice} $currency'),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Divider(height: 1, color: Colors.grey),
          ),
          _buildPriceRow(
            AppStrings.totalPrice,
            '${prices.totalPrice} $currency',
            isTotal: true,
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: isTotal ? 20 : 14,
              color: isTotal ? AppColors.primaryColor : Colors.black,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: isTotal ? 18 : 14,
              color: isTotal ? AppColors.primaryColor : Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
