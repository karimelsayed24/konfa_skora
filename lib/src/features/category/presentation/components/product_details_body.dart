
import '../widgets/product_additions_section.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:konaf_skora/core/utils/app_strings.dart';
import 'package:konaf_skora/core/utils/app_styles.dart';

import '../../data/model/product_details_response.dart';
import '../widgets/custom_title_in_details.dart';
import '../widgets/product_info_widget.dart';

class ProductDetailsBody extends StatelessWidget {
  final ProductDetails productDetails;

  const ProductDetailsBody({super.key, required this.productDetails});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(0.5),
                    Colors.transparent,
                  ],
                ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
              },
              blendMode: BlendMode.darken,
              child: CachedNetworkImage(
                imageUrl: productDetails.image,
                height: 440.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          Padding(
            padding:
                EdgeInsets.only(top: 400.h), 
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.r),
                  topRight: Radius.circular(25.r),
                ),
                border: Border.all(color: Colors.grey.shade200, width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductInfoWidget(
                      title: productDetails.name,
                      price: productDetails.price,
                      avgRate: productDetails.avgRate,
                    ),
                    // Recipe
                    const CustomTitleInDetails(
                      title: AppStrings.recipes,
                    ),
                    SizedBox(
                      width: 320.w,
                      child: Text(
                        productDetails.recipe,
                        style: AppStyles.s12,
                      ),
                    ),

                    SizedBox(height: 20.h),
                              ProductAdditionsSection(additions: productDetails.additions),

                
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
