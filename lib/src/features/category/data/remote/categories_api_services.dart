import 'package:dartz/dartz.dart';

import '../../../../../core/constants/endpoints_strings.dart';
import '../../../../../core/data/api/api_consumer.dart';
import '../../../../../core/errors/error_model.dart';
import '../../../../../core/errors/exceptions.dart';
import '../model/category_model.dart';
import '../model/product_details_response.dart';
import '../model/product_model.dart';

abstract class CategoriesApiService {
  Future<Either<ErrorModel, CategoryResponse>> getCategories();
  // Future<Either<ErrorModel, List<ProductModel>>> getCategoryProducts({int? categoryId});
  Future<Either<ErrorModel, ProductResponse>> getCategoryProducts({
     int? categoryId,
    int? subCategoryId,
    String? searchName,
    String? priceOrder,
  });
  Future<Either<ErrorModel, ProductDetailsResponse>> getProductDetails(
      int productId);
}

class CategoriesApiServiceImpl implements CategoriesApiService {
  final ApiConsumer api;

  CategoriesApiServiceImpl(this.api);

  @override
  Future<Either<ErrorModel, CategoryResponse>> getCategories() async {
    try {
      final response = await api.get(EndpointsStrings.allCategories);
      final categoryResponse = CategoryResponse.fromJson(response);
      return Right(categoryResponse);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, ProductResponse>> getCategoryProducts({
    int? categoryId,
    int? subCategoryId,
    String? searchName,
    String? priceOrder,
  }) async {
    try {
    String endpoint = '${EndpointsStrings.categoryProducts}$categoryId';

    if (subCategoryId != null) {
      endpoint += '/subcategory/$subCategoryId';
    } else {
      endpoint += '/subcategory';
    }

    final queryParams = <String, dynamic>{};

    if (searchName != null && searchName.isNotEmpty) {
      queryParams['search'] = searchName;
    }

   

    if (priceOrder != null) {
      queryParams['price'] = priceOrder;
    }

    final queryString = queryParams.isNotEmpty 
        ? '?${queryParams.entries.map((e) => '${e.key}=${e.value}').join('&')}'
        : '';

    final fullEndpoint = endpoint + queryString;

    final response = await api.get(fullEndpoint);
      final productResponse = ProductResponse.fromJson(response);
      return Right(productResponse);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, ProductDetailsResponse>> getProductDetails(
      int productId) async {
    try {
      final response =
          await api.get('${EndpointsStrings.productDetails}$productId');
      final productDetailsResponse = ProductDetailsResponse.fromJson(response);
      return Right(productDetailsResponse);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
}
