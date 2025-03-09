
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:konaf_skora/src/features/my_orders/data/model/order_response_model.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';

class SecondColumn extends StatelessWidget {
  const SecondColumn({
    super.key,
    required this.order,
  });

  final OrderData order;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${AppStrings.orderNumber}: #${order.orderNum} ',
            style: AppStyles.s16,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 8.h),
          Text(
            '${AppStrings.numberOfPieces}: ${order.itemsCount}',
            style: AppStyles.s16,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 8.h),
          Wrap(
            spacing: 4,
            runSpacing: 4,
            children: order.items
                .map((item) => Text(
                      '${order.items.indexOf(item) > 0 ? '، ' : ''}${item.productName}',
                      style:
                          AppStyles.s10.copyWith(color: AppColors.secondGrey),
                      overflow: TextOverflow.ellipsis,
                    ))
                .toList(),
          ),
          SizedBox(height: 8.h),
          Text.rich(
            TextSpan(
              text: order.totalPrice,
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
        ],
      ),
    );
  }
}
