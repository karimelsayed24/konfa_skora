import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../../data/model/product_model.dart';
import '../repo/categories_repository.dart';
// class GetCategoryProductsUseCase {
//   final CategoriesRepository repository;

//   GetCategoryProductsUseCase(this.repository);

//   Future<Either<ErrorModel, List<ProductModel>>> fetchCategoriesProducts({int? categoryId}) async {
//     return await repository.getCategoryProducts(categoryId: categoryId);
//   }
// }
class GetCategoryProductsUseCase {
  final CategoriesRepository repository;

  GetCategoryProductsUseCase(this.repository);

  Future<Either<ErrorModel, List<ProductModel>>> fetchCategoriesProducts({
    int? categoryId,
    int? subCategoryId,
    String? searchName,
    String? priceOrder,
  }) async {
    return await repository.getCategoryProducts(
      categoryId: categoryId,
      subCategoryId: subCategoryId,
      searchName: searchName,
      priceOrder: priceOrder,
    );
  }
}