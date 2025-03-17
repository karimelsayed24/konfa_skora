import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:konaf_skora/core/common/widgets/custom_btn.dart';
import 'package:konaf_skora/src/features/productDetails/presentation/widget/product_image_widget.dart';
import 'package:konaf_skora/src/features/productDetails/presentation/widget/product_info_widget.dart';
import 'package:konaf_skora/src/features/productDetails/presentation/widget/product_ingredients_widget.dart';
import 'package:konaf_skora/src/features/productDetails/presentation/widget/product_options_widget.dart';
import 'package:konaf_skora/src/features/productDetails/presentation/widget/quantity_selector_widget.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProductImageWidget(),
            const ProductInfoWidget(),
            const ProductIngredientsWidget(),
            const QuantitySelectorWidget(),
            const ProductOptionsWidget(),
            const SizedBox(height: 16),
            CustomButton(
              text: 'اضف الي السله',
              onPressed: () {},
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
