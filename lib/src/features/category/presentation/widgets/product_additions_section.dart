import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:konaf_skora/core/utils/app_styles.dart';

import '../../../../../core/common/widgets/custom_btn.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../data/model/product_details_response.dart';
import 'custom_title_in_details.dart';

class ProductAdditionsSection extends StatefulWidget {
  final List<Addition> additions;

  const ProductAdditionsSection({super.key, required this.additions});

  @override
  _ProductAdditionsSectionState createState() =>
      _ProductAdditionsSectionState();
}

class _ProductAdditionsSectionState extends State<ProductAdditionsSection> {
  int _quantity = 1;
  List<bool> _selectedAdditions = [];

  @override
  void initState() {
    super.initState();
    // Initialize selected additions with false values
    _selectedAdditions =
        List.generate(widget.additions.length, (index) => false);
  }

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity > 1) _quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomTitleInDetails(
              title: AppStrings.quantity,
            ),
            Container(
              height: 34.h,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon:  Icon(Icons.add, size: 16.r,color: Colors.white),
                    onPressed: _incrementQuantity,
                  ),
                  Text(
                    '$_quantity',
                    style: AppStyles.s14.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  IconButton(
                    icon:  Icon(Icons.remove, size: 16.r, color: Colors.white),
                    onPressed: _decrementQuantity,
                  ),
                ],
              ),
            ),
          ],
        ),
         SizedBox(height: 16.h),

       const CustomTitleInDetails(
              title: AppStrings.additions,
            ),
        Text(
          AppStrings.makeAdditionAsYouNeed,
          style: AppStyles.s12,
        ),
                 SizedBox(height: 16.h),

        Column(
          children: List.generate(widget.additions.length, (index) {
            final addition = widget.additions[index];
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedAdditions[index] = !_selectedAdditions[index];
                });
              },
              child: Row(
                children: [
                
                  Expanded(
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: AppColors.primaryColor,
                          size: 16.r,
                        ),
                        Text(
                          addition.name,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      '${addition.price} ر.س',
                      style:AppStyles.s12.copyWith(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w400,
                      ), 
                     
                    ),
                  ),
                    Checkbox(
                    value: _selectedAdditions[index],
                    onChanged: (bool? value) {
                      setState(() {
                        _selectedAdditions[index] = value ?? false;
                      });
                    },
                    side: const BorderSide(color: AppColors.primaryColor),
                    activeColor:AppColors.primaryColor,
                    checkColor: AppColors.white,
                  ),
                ],
              ),
            );
          }),
        ),
         SizedBox(height: 30.h),
        Align(
          alignment: Alignment.center,
          child: CustomButton(
            text: AppStrings.addToCart,
            onPressed: () {
              // Add to cart logic
            },
          ),
        ),
      ],
      
    );
  }
}
