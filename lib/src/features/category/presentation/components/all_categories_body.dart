import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routes/router_names.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../auth/presentation/widgets/create_account_title.dart';
import '../../../home/presentation/widgets/category_item.dart';
import '../../data/model/category_model.dart';

class AllCategoriesBody extends StatelessWidget {
  const AllCategoriesBody({
    super.key,
    required this.categories,
  });
  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16.0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             CreateAccountTitle(
              title: AppStrings.allTypeOfDesert,
              subTitle: AppStrings.choiceAllType,
            ),
            SizedBox(height: 30.h),
            Expanded(
              child: CategoryGridView(
                categories: categories,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class CategoryGridView extends StatelessWidget {
  const CategoryGridView({
    super.key,
    required this.categories,
  });

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.8,
            crossAxisSpacing: 11,
            mainAxisSpacing: 23,
          ),
          delegate: SliverChildBuilderDelegate((context, index) {
            return CategoryItem(
              category: categories[index],
              onTap: () {
                context.push(RouterNames.categoryProductsView,
                    extra: categories[index]);
              },
            );
          }, childCount: categories.length),
        ),
      ],
    );
  }
}
