import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/point_usecase.dart';
import 'prize_products_state.dart';

class PrizeProductsCubit extends Cubit<PrizeProductsState> {
  final GetPrizeProductsUseCase getPrizeProductsUseCase;
  final GetExtraPointsOptionsUseCase getExtraPointsOptionsUseCase;
  final GetUserPointsUseCase getUserPointsUseCase;

  PrizeProductsCubit({
    required this.getPrizeProductsUseCase,
    required this.getExtraPointsOptionsUseCase,
    required this.getUserPointsUseCase,
  }) : super(const PrizeProductsState.initial());



  Future<void> loadAllData() async {
    emit(const PrizeProductsState.loading());
    
    final prizeProductsResult = await getPrizeProductsUseCase();
    
    await prizeProductsResult.fold(
      (failure) {
        emit(PrizeProductsState.error(message: failure.message));
      },
      (prizeProductsResponse) async {
        final extraPointsOptionsResult = await getExtraPointsOptionsUseCase();
        
        await extraPointsOptionsResult.fold(
          (failure) {
            emit(PrizeProductsState.error(message: failure.message));
          },
          (extraPointsOptionsResponse) async {
            final userPointsResult = await getUserPointsUseCase();
            
            userPointsResult.fold(
              (failure) {
                emit(PrizeProductsState.error(message: failure.message));
              },
              (userPointsResponse) {
                emit(PrizeProductsState.loaded(
                  prizeProductsResponse: prizeProductsResponse,
                  extraPointsOptionsResponse: extraPointsOptionsResponse,
                  userPointsResponse: userPointsResponse,
                ));
              },
            );
          },
        );
      },
    );
  }
}