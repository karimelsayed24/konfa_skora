import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../data/model/prize_products_response.dart';

class PrizeProductItemCard extends StatelessWidget {
  final PrizeProduct product;

  const PrizeProductItemCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final int percentage =
        (product.currentPoints * 100 ~/ product.neededPoints);

    return Container(
      width: 191.w,
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: AppColors.borderGrey,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              20.r,
            ),
            child: CachedNetworkImage(
              imageUrl: product.image,
              height: 180.h,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.h,right: 10.w, left: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              '${AppStrings.requiredPoints} : ${product.neededPoints} ',
                              style: AppStyles.s14),
                          SizedBox(height: 4.h),
                          Text(
                              '${AppStrings.currentPoints} : ${product.currentPoints}',
                              style: AppStyles.s12),
                        ],
                      ),
                    ),
                    Container(
                      width: 35.w,
                      height: 34.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.red.shade100,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '$percentage%',
                          style: TextStyle(
                            color: Colors.red.shade400,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    // Points Info
                  ],
                ),
                SizedBox(height: 6.h),
                Text(AppStrings.collectPointAndGetGift, style: AppStyles.s12),
                SizedBox(height: 6.h),
                SizedBox(
                  width: double.infinity,
                  height: 36.h,
                  child: ElevatedButton(
                    onPressed: product.canAddProduct ? () {} : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      elevation: 0,
                    ),
                    child: Text(AppStrings.redeemNow,
                        style: AppStyles.s12.copyWith(
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
