
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../data/model/prize_products_response.dart';
import '../widgets/prize_product_item_card.dart';

class RewardsComponents extends StatelessWidget {
  const RewardsComponents({
    super.key,
    required this.prizeProductsResponse,
  });
final PrizeProductsResponse  prizeProductsResponse;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.rewards,
            style: AppStyles.s20.copyWith(
              color: AppColors.textColor,
              fontWeight: FontWeight.w500,
            )),
        const SizedBox(height: 10),
        
        SizedBox(
          height: 339.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: prizeProductsResponse.data.length,
            itemBuilder: (context, index) {
              return PrizeProductItemCard(
                  product: prizeProductsResponse.data[index]);
            },
          ),
        ),
      ],
    );
  }
}
