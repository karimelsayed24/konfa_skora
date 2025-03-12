import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:konaf_skora/core/routes/router_names.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../data/model/order_response_model.dart';
import 'image_column.dart';
import 'second_column.dart';
import 'third_column.dart';

class OrderCard extends StatelessWidget {
  final OrderData order;

  const OrderCard({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(RouterNames.myOrderDetails, extra: {'orderId': order.id});
      },
      child: Container(
        height: 147.h,
        margin: EdgeInsets.symmetric(horizontal: 7.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: AppColors.lightGrey, width: 2.w),
        ),
        child: Padding(
          padding: EdgeInsets.all(11.r),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ImageColumn(
                image:'order.image',
              ),
              SizedBox(width: 10.w),

              SecondColumn(order: order),
              ThirdColumn(order: order)
            ],
          ),
        ),
      ),
    );
  }
}
