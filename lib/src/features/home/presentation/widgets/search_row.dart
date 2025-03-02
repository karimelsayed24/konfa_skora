import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';

class SearchRow extends StatelessWidget {
  const SearchRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 45.h,
              decoration: BoxDecoration(
                color: AppColors.fillGrey,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'ابحث عن منتج',
                  hintStyle: TextStyle(color: AppColors.lightColor),
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.lightColor,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                ),
              ),
            ),
          ),
           SizedBox(width: 10.w),
          Container(
            height: 45.h,
            width: 45.w,
            decoration: BoxDecoration(
              color: AppColors.fillGrey,
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: IconButton(
              icon: const Icon(Icons.favorite, color: AppColors.lightColor),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
