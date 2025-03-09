import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../../data/model/daily_order_response.dart';
import '../repo/home_repo.dart';

class GetDailyOrderUC {
  final HomeRepo _homeRepo;
  GetDailyOrderUC(this._homeRepo);

  Future<Either<ErrorModel, DailyOrderResponse>> getDailyOrder() async {
    return _homeRepo.getDailyOrder();
  }
}
