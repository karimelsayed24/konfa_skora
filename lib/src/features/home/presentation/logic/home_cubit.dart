import 'package:bloc/bloc.dart';

import '../../domain/usecase/get_banner_uc.dart';
import '../../domain/usecase/get_best_seller_uc.dart';
import '../../domain/usecase/get_daily_order_uc.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetBannerUc _getBannerUseCase;
  final GetBestSellerUC _getBestSellerUC;
  final GetDailyOrderUC _getDailyOrderUC;

  HomeCubit(
    this._getBannerUseCase,
    this._getBestSellerUC,
    this._getDailyOrderUC,
  ) : super(HomeState.initial());

  Future<void> getBanner() async {
    emit(state.copyWith(
      bannerState: state.bannerState.copyWith(isLoading: true)
    ));
    
    final result = await _getBannerUseCase.getBanner();
    
    result.fold(
      (error) => emit(state.copyWith(
        bannerState: state.bannerState.copyWith(
          isLoading: false,
          error: error,
          data: null,
        )
      )),
      (response) => emit(state.copyWith(
        bannerState: state.bannerState.copyWith(
          isLoading: false,
          data: response,
          error: null,
        )
      )),
    );
  }

  Future<void> getBestSeller() async {
    emit(state.copyWith(
      bestSellerState: state.bestSellerState.copyWith(isLoading: true)
    ));
    
    final result = await _getBestSellerUC.getBestSeller();
    
    result.fold(
      (error) => emit(state.copyWith(
        bestSellerState: state.bestSellerState.copyWith(
          isLoading: false,
          error: error,
          data: null,
        )
      )),
      (response) => emit(state.copyWith(
        bestSellerState: state.bestSellerState.copyWith(
          isLoading: false,
          data: response,
          error: null,
        )
      )),
    );
  }

  Future<void> getDailyOrder() async {
    emit(state.copyWith(
      dailyOrderState: state.dailyOrderState.copyWith(isLoading: true)
    ));
    
    final result = await _getDailyOrderUC.getDailyOrder();
    
    result.fold(
      (error) => emit(state.copyWith(
        dailyOrderState: state.dailyOrderState.copyWith(
          isLoading: false,
          error: error,
          data: null,
        )
      )),
      (response) => emit(state.copyWith(
        dailyOrderState: state.dailyOrderState.copyWith(
          isLoading: false,
          data: response,
          error: null,
        )
      )),
    );
  }

  // استدعاء جميع البيانات مرة واحدة
  Future<void> loadAllHomeData() async {
    getBanner();
    getBestSeller();
    getDailyOrder();
  }
}
// class HomeCubit extends Cubit<HomeState> {
//   final GetBannerUc _getBannerUseCase;
//   final GetBestSellerUC _getBestSellerUC;
//   final GetDailyOrderUC _getDailyOrderUC;

//   HomeCubit(
//     this._getBannerUseCase,
//     this._getBestSellerUC,
//     this._getDailyOrderUC,
//   ) : super(const HomeState.initial());

//   Future<void> getBanner() async {
//     emit(const HomeState.loadingBanner());
//     final result = await _getBannerUseCase.getBanner();
//     result.fold(
//       (error) => emit(HomeState.errorBanner(error)),
//       (response) => emit(HomeState.successBanner(response)),
//     );
//   }

//   Future<void> getBestSeller() async {
//     emit(const HomeState.loadingBestSeller());
//     final result = await _getBestSellerUC.getBestSeller();
//     result.fold(
//       (error) => emit(HomeState.errorBestSeller(error)),
//       (response) => emit(HomeState.successBestSeller(response)),
//     );
//   }

//   Future<void> getDailyOrder() async {
//     emit(const HomeState.loadingDailyOrder());
//     final result = await _getDailyOrderUC.getDailyOrder();
//     result.fold(
//       (error) => emit(HomeState.errorDailyOrder(error)),
//       (response) => emit(HomeState.successDailyOrder(response)),
//     );
//   }
// }
