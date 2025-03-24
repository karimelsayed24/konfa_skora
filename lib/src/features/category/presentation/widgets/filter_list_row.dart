
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../../../core/theme/app_colors.dart';

import '../../../../../core/utils/app_strings.dart';

import '../../data/model/category_model.dart';
import '../logic/categories_products_cubit.dart';


class FilterListRow extends StatelessWidget {
  const FilterListRow({
    super.key,
    required this.filters,
    required this.selectedFilter,
    required this.category,
  });

  final List<CategoryChild> filters;
  final CategoryChild? selectedFilter;
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.w),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: filters.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding:  EdgeInsets.only(left: 8.0.w),
                child: FilterChip(
                  label: const Text(AppStrings.all),
                  selected: selectedFilter == null,
                  backgroundColor: AppColors.filterGrey,
                  selectedColor: AppColors.primaryColor,
                  onSelected: (bool selected) {
                    if (selected) {
                      BlocProvider.of<CategoryProductsCubit>(context)
                          .clearFilter(category);
                    }
                  },
                  labelStyle: TextStyle(
                    color: selectedFilter == null
                        ? AppColors.fillGrey
                        : AppColors.grey,
                  ),
                ),
              );
            }
    
            final filter = filters[index - 1];
            final isSelected = selectedFilter?.id == filter.id;
    
            return Padding(
              padding:  EdgeInsets.only(left: 8.0.w),
              child: FilterChip(
                label: Text(filter.name),
                selected: isSelected,
                backgroundColor: AppColors.filterGrey,
                selectedColor: AppColors.primaryColor,
                onSelected: (bool selected) {
                  if (selected) {
                    BlocProvider.of<CategoryProductsCubit>(context)
                        .selectFilter(category, filter);
                  }
                },
                labelStyle: TextStyle(
                  color: isSelected ? AppColors.white : AppColors.grey,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
