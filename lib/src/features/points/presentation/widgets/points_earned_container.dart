import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:konaf_skora/core/utils/app_assets.dart';
import 'package:konaf_skora/core/utils/app_styles.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';

class PointsEarnedContainer extends StatelessWidget {
  const PointsEarnedContainer({
    super.key,
    required this.points,
  });
  final int points;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                AppStrings.pointsEarned,
                style: AppStyles.s20.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
               SizedBox(width: 8.w),
              SvgPicture.asset(AppAssets.giftIcon)
            ],
          ),
           SizedBox(height: 10.h),
          Text(
            '${points} نقطة',
            style: AppStyles.s16.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
           SizedBox(height: 10.h),
          Text(
            AppStrings.youWillGetAGift,
            style: AppStyles.s12.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
