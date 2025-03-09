import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../data/model/order_details.dart';
import '../widgets/image_column.dart';
class BuildOrderDetails extends StatelessWidget {
  const BuildOrderDetails({super.key, required this.orderDetails});
final OrderDetailsData orderDetails;
  @override
  Widget build(BuildContext context) {
   
  
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 7.w, vertical: 8.h),
        padding: EdgeInsets.symmetric(vertical: 32.w, horizontal: 10.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: AppColors.lightGrey, width: 2.w),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildOrderInfoCard(context, orderDetails),
            SizedBox(height: 16.h),
            Expanded(
              child: ListView.builder(
                itemCount: orderDetails.items.length,
                itemBuilder: (context, index) {
                  return _buildOrderItemCard(
                      context, orderDetails.items[index]);
                },
              ),
            ),
          ],
        ));
  }
   }

 

  Widget _buildOrderInfoCard(BuildContext context, OrderDetailsData order) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(
              TextSpan(
                text: '${AppStrings.orderNumber} : ',
                style: AppStyles.s16,
                children: <TextSpan>[
                  TextSpan(
                    text: '# ${order.order_num} ',
                    style: AppStyles.s14.copyWith(color: AppColors.grey),
                  ),
                ],
              ),
            ),
            Text(
              order.created_at,
              style: AppStyles.s14,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Text.rich(
          TextSpan(
            text: '${AppStrings.numberOfPieces} : ',
            style: AppStyles.s16,
            children: <TextSpan>[
              TextSpan(
                text: ' ${order.items_count}',
                style: AppStyles.s14.copyWith(color: AppColors.grey),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        Text.rich(
          TextSpan(
            text: '${AppStrings.price} : ',
            style: AppStyles.s16,
            children: <TextSpan>[
              TextSpan(
                text: order.total_price,
                style: AppStyles.s14.copyWith(color: AppColors.grey),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        Text('${AppStrings.myOrderDetails} : ', style: AppStyles.s14)
      ],
    );
  }

  Widget _buildOrderItemCard(BuildContext context, OrderItem item) {
    return Card(
      elevation: 1,
      margin: EdgeInsets.only(bottom: 16.h),
      color: AppColors.lightBorderGrey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
      child: Padding(
        padding: EdgeInsets.all(10.r),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.product_name,
                    style: AppStyles.s14.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...item.item_additions.map((addition) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        addition.name,
                        style: AppStyles.s14.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    );
                  }).toList(),
                  const SizedBox(height: 8),
                  Text.rich(
                    TextSpan(
                      text: '${AppStrings.price} : ',
                      style: AppStyles.s16,
                      children: <TextSpan>[
                        TextSpan(
                          text: item.price,
                          style: AppStyles.s14.copyWith(color: AppColors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            ImageColumn(
              image: item.product_image,
            ),
          ],
        ),
      ),
    );
  }