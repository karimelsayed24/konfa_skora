import 'package:flutter/material.dart';
import 'package:konaf_skora/core/theme/app_colors.dart';
import 'package:konaf_skora/core/utils/app_styles.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'حابب تطلب ايه انهاردة',
            style: AppStyles.s16.copyWith(fontWeight: FontWeight.bold),
          ),
          InkWell(
            onTap: () {},
            child: Text(
              'الكل',
              style: AppStyles.s14.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
