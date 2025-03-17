import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
  
  
   Widget buildPriceRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: isTotal ? 20 : 14,
              color: isTotal ? AppColors.primaryColor : Colors.black,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: isTotal ? 18 : 14,
              color: isTotal ? AppColors.primaryColor : Colors.grey[600],
            ),
          ),
        ],
      ),
    );
 }