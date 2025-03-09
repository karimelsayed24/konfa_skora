import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../../data/model/banner_response.dart';
import '../repo/home_repo.dart';

class GetBannerUc {
  final HomeRepo _homeRepo;
  GetBannerUc(this._homeRepo);

  Future<Either<ErrorModel, BannerResponse>> getBanner() async {
    return _homeRepo.getBanner();
  }
}
