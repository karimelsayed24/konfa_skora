import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../repo/home_repo.dart';

class AddToFavoriteUseCase {
  final HomeRepo homeRepo;

  AddToFavoriteUseCase(this.homeRepo);

 Future<Either<ErrorModel, bool>> addToFavorite(int productId) async {
    return await homeRepo.addToFavorite(productId);
  }
}