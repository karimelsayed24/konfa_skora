import 'package:dartz/dartz.dart';
import 'package:konaf_skora/src/features/category/data/model/category_model.dart';
import 'package:konaf_skora/src/features/category/data/model/product_model.dart';

import '../../../../../core/errors/error_model.dart';
import '../../data/model/product_details_response.dart';
import '../../data/remote/categories_remote_ds.dart';

abstract class CategoriesRepository {
  Future<Either<ErrorModel, List<CategoryModel>>> getCategories();
  Future<Either<ErrorModel, List<ProductModel>>> getCategoryProducts({int? categoryId});
  Future<Either<ErrorModel, ProductDetailsResponse>> getProductDetails(int productId);

}

class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoriesRemoteDs remoteDs;
  CategoriesRepositoryImpl(this.remoteDs);


  @override
  Future<Either<ErrorModel, List<CategoryModel>>> getCategories() async {
    final result = await remoteDs.getCategories();
    return result.fold(
      (error) => Left(error),
      (response) => Right(response.data),
    );
  }
  
  @override
  Future<Either<ErrorModel, List<ProductModel>>> getCategoryProducts({int? categoryId}) async {
    final result = await remoteDs.getCategoryProducts(categoryId: categoryId);
    return result.fold(
      (error) => Left(error),
      (response) => Right(response.data),
    );
  }
  
  @override
  Future<Either<ErrorModel, ProductDetailsResponse>> getProductDetails(int productId) async {
    return await remoteDs.getProductDetails(productId);
   
  }
}