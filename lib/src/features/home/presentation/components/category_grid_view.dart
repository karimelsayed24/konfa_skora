
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routes/router_names.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../category/data/model/category_model.dart';
import '../../../category/presentation/logic/categories_cubit.dart';
import '../../../category/presentation/logic/categories_state.dart';
import '../widgets/category_item.dart';

class CategoriesInHome extends StatelessWidget {
  const CategoriesInHome({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator())),
          loaded: (categories) => HomeCategoryGridView(categories: categories),
          error: (message) => SliverToBoxAdapter(
              child: Center(child: Text(message, style: TextStyle(color: AppColors.primaryColor)))),
          orElse: () => const SliverToBoxAdapter(child: SizedBox()),
        );
      },
    );
  }
}

class HomeCategoryGridView extends StatelessWidget {
  const HomeCategoryGridView({super.key, required this.categories});
  final List<CategoryModel> categories;
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.8,
        crossAxisSpacing: 11,
        mainAxisSpacing: 23,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return CategoryItem(
            category: categories[index],
            onTap: () {
              context.push(RouterNames.categoryProductsView,
                  extra: categories[index]);
            },
          );
        },
        childCount: categories.length > 6 ? 6 : categories.length,
      ),
    );
  }
}
