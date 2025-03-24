
import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../../data/model/product_details_response.dart';
import '../repo/categories_repository.dart';

class GetProductDetailsUseCase  {
  final CategoriesRepository repository;

  GetProductDetailsUseCase(this.repository);

  
  Future<Either<ErrorModel, ProductDetailsResponse>> execute( int productId) async {
    return await repository.getProductDetails(productId);
  }
}