import 'package:dartz/dartz.dart';
import 'package:konaf_skora/src/features/category/data/model/product_model.dart';

import '../../../../../core/errors/error_model.dart';
import '../model/category_model.dart';
import '../model/product_details_response.dart';
import 'categories_api_services.dart';

abstract class CategoriesRemoteDs {

  Future<Either<ErrorModel, CategoryResponse>> getCategories();
    Future<Either<ErrorModel, ProductResponse>> getCategoryProducts({int? categoryId});
  Future<Either<ErrorModel, ProductDetailsResponse>> getProductDetails(int productId);

}

class CategoriesRemoteDsImpl extends CategoriesRemoteDs {
  final CategoriesApiService api;
  CategoriesRemoteDsImpl(this.api);
  @override
  Future<Either<ErrorModel, CategoryResponse>> getCategories() async {
    return api.getCategories();
  }
  
    @override
  Future<Either<ErrorModel, ProductResponse>> getCategoryProducts({int? categoryId}) async {
    return api.getCategoryProducts(categoryId: categoryId);
  }
  
  @override
  Future<Either<ErrorModel, ProductDetailsResponse>> getProductDetails(int productId) async {
    return api.getProductDetails(productId);
  }
}