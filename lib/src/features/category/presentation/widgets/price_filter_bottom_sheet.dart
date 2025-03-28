import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:konaf_skora/core/common/widgets/custom_btn.dart';

import '../../data/model/category_model.dart';
import '../logic/categories_products_cubit.dart';

class PriceFilterBottomSheet extends StatefulWidget {
  final CategoryModel category;
 // final CategoryProductsCubit categoryProductsCubit;

  const PriceFilterBottomSheet({
    super.key,
    required this.category,
     //   required this.categoryProductsCubit,

  });

  @override
  _PriceFilterBottomSheetState createState() => _PriceFilterBottomSheetState();
}

class _PriceFilterBottomSheetState extends State<PriceFilterBottomSheet> {
  String _priceOrder = 'low_to_high';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      height: 300.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Column(
        children: [
          Text(
            'ترتيب المنتجات حسب السعر',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            'اختر ترتيب السعر',
            style: TextStyle(
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // زر الترتيب من الأقل سعرًا إلى الأعلى
              ChoiceChip(
                label: Text('من الأقل إلى الأعلى'),
                selected: _priceOrder == 'low_to_high',
                onSelected: (bool selected) {
                  setState(() {
                    _priceOrder = 'low_to_high';
                  });
                },
              ),
              SizedBox(width: 10.w),
              // زر الترتيب من الأعلى سعرًا إلى الأقل
              ChoiceChip(
                label: Text('من الأعلى إلى الأقل'),
                selected: _priceOrder == 'high_to_low',
                onSelected: (bool selected) {
                  setState(() {
                    _priceOrder = 'high_to_low';
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 20.h),
          CustomButton(
            onPressed: () {
              context.read<CategoryProductsCubit>().filterByPrice(
                    category: widget.category,
                    priceOrder: _priceOrder,
                  );
          context.pop(context);
            },
            text: 'تطبيق الترتيب',
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
