import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/common/widgets/custom_btn.dart';
import '../../../../../core/routes/router_names.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../data/model/product_model.dart';

class CategoryProductItem extends StatelessWidget {
  final ProductModel product;

  const CategoryProductItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 328.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.borderGrey, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(19.r),
            child: Image.network(
              product.image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 185.h,
              errorBuilder: (ctx, error, _) => Container(
                color: AppColors.fillGrey,
                height: 185.h,
                child: const Center(
                    child: Icon(Icons.cake, size: 50, color: Colors.grey)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                right: 6.0.h, left: 6.0.h, top: 4.0.h, bottom: 9.0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: AppStyles.s15.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 10.h),
                Text(
                  product.price,
                  style: AppStyles.s16.copyWith(
                    color: AppColors.greyText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                CustomButton(
                  height: 35.h,
                  text: AppStrings.addToCart,
                  onPressed: () {
                    print('------------------${product.id}') ;
                    context.push(RouterNames.productDetailsView,
                        extra: {
                          'productId': product.id
                        }
                       
                        );
                  },
                  textStyle: AppStyles.s12.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
