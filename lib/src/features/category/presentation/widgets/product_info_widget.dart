import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class ProductInfoWidget extends StatelessWidget {
  const ProductInfoWidget(
      {super.key,
      required this.title,
      required this.price,
      required this.avgRate});
  final String title;
  final String price;
  final String avgRate;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppStyles.s24,
              textAlign: TextAlign.right,
            ),
            Container(
              height: 45.h,
              width: 45.w,
              decoration: BoxDecoration(
                color: AppColors.filterGrey,
                borderRadius: BorderRadius.circular(14.r),
                border: Border.all(color: AppColors.borderGrey, width: .5.w),
              ),
              child: IconButton(
                icon: const Icon(Icons.favorite, color: AppColors.lightColor),
                onPressed: () {},
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            const Icon(Icons.star, color: Colors.amber),
            Text(
              '5/ $avgRate',
              style: AppStyles.s15.copyWith(
                color: AppColors.textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              price,
              style: AppStyles.s20.copyWith(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 4.w),
            Text(
              'ر.س',
              style: AppStyles.s20.copyWith(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
