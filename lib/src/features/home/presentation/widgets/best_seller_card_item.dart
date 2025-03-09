import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../data/model/best_seller_response.dart';

class BestSellerCardItem extends StatelessWidget {
  final BestSellerItem item;

  const BestSellerCardItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 215.w,
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150.h,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              image: DecorationImage(
                image: NetworkImage(item.image),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
                child: Icon(item.isFavorite? Icons.favorite:Icons.favorite_border,
                    size: 20.r, color:item.isFavorite? AppColors.primaryColor:AppColors.grey),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  item.name,
                  style: AppStyles.s15,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        item.description,
                        style: AppStyles.s12,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      item.avgRate,
                      style: AppStyles.s14.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(Icons.star, color: AppColors.yellow, size: 24.r)
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${item.price} ج.م',
                      style: AppStyles.s16.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(
                          minWidth: 20.w,
                          minHeight: 20.h,
                        ),
                        icon: Icon(
                          Icons.add,
                          color: AppColors.white,
                          size: 20.r,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
