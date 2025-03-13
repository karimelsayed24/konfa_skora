import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:konaf_skora/core/theme/app_colors.dart';
import 'package:konaf_skora/core/utils/app_styles.dart';

import '../../../../../core/common/widgets/custom_btn.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../data/model/prize_products_response.dart';

class InviteFriendsCard extends StatelessWidget {
  final ExtraPointsOption option;
  final VoidCallback onInvite;

  const InviteFriendsCard({
    super.key,
    required this.option,
    required this.onInvite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
      margin: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
       crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
               option.getTitle(option.key),
                style: AppStyles.s14,),
              SizedBox(height: 4.h),
              Row(
                children: [
                  Text(
                                       option.value.toString(),

                   style: AppStyles.s16.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    AppStrings.point,
                   style: AppStyles.s16.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Text(
              option.getDescription(option.key),
                style: AppStyles.s10.copyWith(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          CustomButton(
            onPressed: onInvite,
            text: 'ادعو الان',
            width: 90.w,
            height: 40.h,
            textStyle: AppStyles.s12.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
