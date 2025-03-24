import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';

class SearchRow extends StatelessWidget {
  const SearchRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 45.h,
              padding: EdgeInsets.only(right: 16.w),
              decoration: BoxDecoration(
                color: AppColors.filterGrey,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: AppColors.borderGrey, width: .5.w),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'ابحث عن منتج',
                  hintStyle: const TextStyle(color: AppColors.lightColor),
                  suffixIcon: const Icon(
                    Icons.search,
                    color: AppColors.borderGrey,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                ),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Container(
            height: 45.h,
            width: 45.w,
            decoration: BoxDecoration(
              color: AppColors.filterGrey,
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(color: AppColors.borderGrey, width: .5.w),
            ),
            child: IconButton(
              icon: const Icon(Icons.tune, color: AppColors.lightColor),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
