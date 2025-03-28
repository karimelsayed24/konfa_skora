import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konaf_skora/core/utils/custom_app_bar.dart';
import '../../data/model/category_model.dart';
import '../components/category_product_body.dart';
import '../logic/categories_products_cubit.dart';
import '../logic/categories_products_state.dart';

class CategoryProductView extends StatelessWidget {
  final CategoryModel category;

  const CategoryProductView({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: customAppBar(context, category.name),
        body: BlocBuilder<CategoryProductsCubit, CategoryProductsState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (products, filters, selectedFilter,subCategoryId ,name, priceOrder,) {
                return CategoryProductBody(
                  category: category,
                  products: products,
                  filters: filters ?? [],
                  selectedFilter: selectedFilter,
                 
                );
              },
              error: (message) => Center(child: Text(message)),
              orElse: () => const SizedBox(),
            );
          },
        ),
      
    );
  }
}

