import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../data/model/category_model.dart';
import '../logic/categories_products_cubit.dart';
import 'price_filter_bottom_sheet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchRow extends StatefulWidget {
  final CategoryModel category;

  const SearchRow({super.key, required this.category});

  @override
  _SearchRowState createState() => _SearchRowState();
}

class _SearchRowState extends State<SearchRow> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounceTimer;

  void _onSearchChanged(String value) {
    _debounceTimer?.cancel();

    _debounceTimer = Timer(const Duration(seconds: 2), () {
      context.read<CategoryProductsCubit>().searchProducts(
            category: widget.category,
            searchName: value,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 45.h,
              padding: EdgeInsets.only(right: 16.w),
              decoration: BoxDecoration(
                color: AppColors.filterGrey,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: AppColors.borderGrey, width: .5.w),
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'ابحث عن منتج',
                  hintStyle: const TextStyle(color: AppColors.lightColor),
                  suffixIcon: const Icon(
                    Icons.search,
                    color: AppColors.borderGrey,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                ),
                onChanged: _onSearchChanged,
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Container(
            height: 45.w,
            width: 45.w,
            decoration: BoxDecoration(
              color: AppColors.filterGrey,
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(color: AppColors.borderGrey, width: .5.w),
            ),
            child: IconButton(
              icon: const Icon(Icons.tune, color: AppColors.lightColor),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext bottomSheetContext) {
                    return BlocProvider.value(
                      value: context.read<CategoryProductsCubit>(),
                      child: PriceFilterBottomSheet(category: widget.category),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }
}
