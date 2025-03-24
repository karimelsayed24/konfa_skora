
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/category_model.dart';
import '../../data/model/product_model.dart';

part 'categories_products_state.freezed.dart';

@freezed
class CategoryProductsState with _$CategoryProductsState {
  const factory CategoryProductsState.initial() = _Initial;
  const factory CategoryProductsState.loading() = _Loading;
  const factory CategoryProductsState.loaded({
    required List<ProductModel> products,
    required List<CategoryChild>? filters,
    CategoryChild? selectedFilter,
  }) = _Loaded;
  const factory CategoryProductsState.error(String message) = _Error;
}