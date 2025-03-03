
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class CreateAccountTitle extends StatelessWidget {
  const CreateAccountTitle({super.key, required this.title, required this.subTitle});
final String title;
final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 3.w,
          height: 50.h,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        SizedBox(width: 5.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppStyles.s20.copyWith(
                color: AppColors.textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            // const SizedBox(height: 10),
            Text(
              subTitle,
              style: AppStyles.s16.copyWith(
                color: AppColors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
