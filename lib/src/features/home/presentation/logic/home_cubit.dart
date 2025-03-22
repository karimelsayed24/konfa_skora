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

  Future<void> loadAllHomeData() async {
    getBanner();
    getBestSeller();
    getDailyOrder();
  }
}