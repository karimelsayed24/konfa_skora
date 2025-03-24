import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../../data/model/category_model.dart';
import '../repo/categories_repository.dart';

class GetCategoriesUseCase {
  final CategoriesRepository repository;

  GetCategoriesUseCase(this.repository);

   Future<Either<ErrorModel, List<CategoryModel>>> execute() async {
    return await repository.getCategories();
  }
}