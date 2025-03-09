
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../data/model/order_response_model.dart';

class ThirdColumn extends StatelessWidget {
  const ThirdColumn({
    super.key,
    required this.order,
  });

  final OrderData order;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            order.createdAt,
            style: AppStyles.s14,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 16.h),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.primaryColor,
                radius: 20.r,
                child: Icon(
                  getStatusIcon(order.statusNum),
                  color: AppColors.white,
                  size: 20.r,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                order.statusText,
                style: TextStyle(
                  color: AppColors.greyText,
                  fontWeight: FontWeight.w400,
                  fontSize: 11.sp,
                ),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }

  IconData getStatusIcon(int statusCode) {
    switch (statusCode) {
      case 0: // جاري التحضير
        return Icons.hourglass_empty;
      case 1: // مكتمل
        return Icons.check;
      case 2: // ملغي
        return Icons.cancel;
      default:
        return Icons.help;
    }
  }
}
