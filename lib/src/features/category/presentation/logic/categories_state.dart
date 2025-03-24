

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/category_model.dart';
part 'categories_state.freezed.dart';

@freezed

class CategoriesState with _$CategoriesState {
  const factory CategoriesState.initial() = _Initial;
  const factory CategoriesState.loading() = _Loading;
  const factory CategoriesState.loaded(List<CategoryModel> categories) = _Loaded;
  const factory CategoriesState.error(String message) = _Error;
}