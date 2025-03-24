import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/model/category_model.dart';
import '../../data/model/product_model.dart';
import '../widgets/category_product_item.dart';
import '../widgets/filter_list_row.dart';
import '../widgets/search_row.dart';

class CategoryProductBody extends StatelessWidget {
  const CategoryProductBody({
    super.key,
    required this.category,
    required this.products,
    required this.filters,
    this.selectedFilter,
  });

  final CategoryModel category;
  final List<ProductModel> products;
  final List<CategoryChild> filters;
  final CategoryChild? selectedFilter;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: 10.h),
          const SearchRow(),
          SizedBox(height: 20.h),
          if (filters.isNotEmpty)
            FilterListRow(
                filters: filters,
                selectedFilter: selectedFilter,
                category: category),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16.r),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75.r,
                crossAxisSpacing: 16.r,
                mainAxisSpacing: 16.r,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return CategoryProductItem(product: products[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
