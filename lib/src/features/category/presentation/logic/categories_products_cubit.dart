

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/category_model.dart';
import '../../domain/usecase/get_categories_products_use_case.dart';
import 'categories_products_state.dart';

class CategoryProductsCubit extends Cubit<CategoryProductsState> {
  final GetCategoryProductsUseCase getCategoryProductsUseCase;

  CategoryProductsCubit( this.getCategoryProductsUseCase)
      : super(const CategoryProductsState.initial());

  Future<void> getProducts({CategoryModel? category, CategoryChild? filter}) async {
    emit(const CategoryProductsState.loading());
    
    final int filterId = filter?.id ?? 1;
    print("---------------"+filterId.toString());
    final result = await getCategoryProductsUseCase.fetchCategoriesProducts(categoryId: filterId);
    
    result.fold(
      (error) => emit(CategoryProductsState.error(error.message)),
      (products) => emit(CategoryProductsState.loaded(
        products: products,
        filters: category?.children,
        selectedFilter: filter,
      )),
    );
  }
  
  void selectFilter(CategoryModel category, CategoryChild filter) {
    getProducts(category: category, filter: filter);
  }
  
  void clearFilter(CategoryModel category) {
    getProducts(category: category);
  }
}