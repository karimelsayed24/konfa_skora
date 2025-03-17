
import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../../data/model/pay_response.dart';
import '../repo/cart_repository.dart';

class CheckOutUseCase {
  final CartRepository repository;

  CheckOutUseCase(this.repository);

  Future<Either<ErrorModel, PayResponse>> call(int addressId, int payType ) async {
    return await repository.checkOut(addressId , payType);
  }
}