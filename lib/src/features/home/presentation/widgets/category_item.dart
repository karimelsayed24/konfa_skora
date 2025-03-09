

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_styles.dart';

class CategoryItem extends StatelessWidget {
  final Map<String, dynamic> category;

  const CategoryItem({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      //  mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 110.h,
            width: 125.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11.r),
              image: DecorationImage(
                image: AssetImage(category['image']),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            category['name'],
            style: AppStyles.s14
          ),
        ],
      
    );
  }
}
