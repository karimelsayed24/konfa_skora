import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:konaf_skora/core/utils/app_styles.dart';

import '../../../../../core/common/widgets/custom_btn.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../cart/presentation/logic/cart_cubit.dart';
import '../../../cart/presentation/widgets/price_row.dart';
import '../../data/model/product_details_response.dart';
import 'custom_title_in_details.dart';
class ProductAdditionsSection extends StatefulWidget {
  const ProductAdditionsSection({
    super.key,
    required this.additions,
    required this.productId,
    required this.isFree, 
    required this.price,
  });
  final List<Addition> additions;
  final int productId;
  final int isFree;
  final String price;
  @override
  State<ProductAdditionsSection> createState() =>
      _ProductAdditionsSectionState();
}

class _ProductAdditionsSectionState extends State<ProductAdditionsSection> {
  int _quantity = 1;
  List<bool> _selectedAdditions = [];
  double _totalPrice = 0.0;

  @override
  void initState() {
    super.initState();
    _selectedAdditions =
        List.generate(widget.additions.length, (index) => false);
    _calculateTotalPrice();
  }

  void _incrementQuantity() {
    setState(() {
      _quantity++;
      _calculateTotalPrice();
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity > 1) {
        _quantity--;
        _calculateTotalPrice();
      }
    });
  }

  void _calculateTotalPrice() {
    // Parse the base price from string to double
    double basePrice = double.tryParse(widget.price.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0.0;
    
    // Calculate price based on quantity
    double quantityPrice = basePrice * _quantity;
    
    // Calculate the total price of selected additions
    double additionsPrice = 0.0;
    for (int i = 0; i < widget.additions.length; i++) {
      if (_selectedAdditions[i]) {
        // Parse addition price from string to double
        double additionPrice = double.tryParse(
            widget.additions[i].price.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0.0;
        additionsPrice += additionPrice;
      }
    }
    
    // Set the total price (base price * quantity + additions price)
    _totalPrice = quantityPrice + additionsPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             CustomTitleInDetails(
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
                    icon: Icon(Icons.add, size: 16.r, color: Colors.white),
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
                    icon: Icon(Icons.remove, size: 16.r, color: Colors.white),
                    onPressed: _decrementQuantity,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
         CustomTitleInDetails(
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
                  _calculateTotalPrice();
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
                      style: AppStyles.s12.copyWith(
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
                        _calculateTotalPrice();
                      });
                    },
                    side: const BorderSide(color: AppColors.primaryColor),
                    activeColor: AppColors.primaryColor,
                    checkColor: AppColors.white,
                  ),
                ],
              ),
            );
          }),
        ),
        SizedBox(height: 30.h),
        buildPriceRow(
            AppStrings.totalPrice,
            '${_totalPrice.toStringAsFixed(2)} ر.س',
            isTotal: true,
          ),
        Align(
          alignment: Alignment.center,
          child: CustomButton(
            text: AppStrings.addToCart,
            onPressed: () {
              List<Map<String, dynamic>> selectedAdditionsList = widget
                  .additions
                  .asMap()
                  .entries
                  .where((entry) => _selectedAdditions[entry.key])
                  .map((entry) => {"id": entry.value.id})
                  .toList();

              context.read<CartCubit>().addToCart(
                    quantity: _quantity,
                    productId: widget.productId,
                    isFree: widget.isFree,
                    additions: selectedAdditionsList,
                  );
            },
          ),
        ),
      ],
    );
  }
}