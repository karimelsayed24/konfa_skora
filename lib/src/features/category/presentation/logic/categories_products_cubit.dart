

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/category_model.dart';
import '../../domain/usecase/get_categories_products_use_case.dart';
import 'categories_products_state.dart';
class CategoryProductsCubit extends Cubit<CategoryProductsState> {
  final GetCategoryProductsUseCase getCategoryProductsUseCase;

  CategoryProductsCubit(this.getCategoryProductsUseCase)
      : super(const CategoryProductsState.initial());

  Future<void> getProducts({
    CategoryModel? category, 
    CategoryChild? filter,
    int? subCategoryId,
    String? searchName,
    String? priceOrder,
  }) async {
    emit(const CategoryProductsState.loading());
    
    final int filterId = filter?.id ?? 1;
    print("---------------$filterId");
    
    final result = await getCategoryProductsUseCase.fetchCategoriesProducts(
      categoryId: filterId,
      searchName: searchName,
      subCategoryId: subCategoryId,
      priceOrder: priceOrder,
    );
    
    result.fold(
      (error) => emit(CategoryProductsState.error(error.message)),
      (products) => emit(CategoryProductsState.loaded(
        products: products,
        filters: category?.children,
        selectedFilter: filter,
        searchName: searchName,
        subCategoryId: subCategoryId,
        priceOrder: priceOrder,
      )),
    );
  }
  
  void selectFilter(CategoryModel category, CategoryChild filter) {
    getProducts(category: category, filter: filter);
  }
  
  void clearFilter(CategoryModel category) {
    getProducts(category: category);
  }

  void searchProducts({
    required CategoryModel category,
    String? searchName,
  }) {
    getProducts(
      category: category,
      searchName: searchName,
    );
  }

  void filterByPrice({
    required CategoryModel category,
    
    required String priceOrder
  }) {
    getProducts(
      category: category,
      priceOrder: priceOrder 
    );
  }
}