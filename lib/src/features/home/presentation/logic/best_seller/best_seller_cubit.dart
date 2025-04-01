
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/get_best_seller_uc.dart';
import 'best_seller_state.dart';

class BestSellerCubit extends Cubit<BestSellerState> {
  final GetBestSellerUC getBestSellerUC;
  
  BestSellerCubit( this.getBestSellerUC) 
      : super(const BestSellerState.initial());
  
  Future<void> getBestSeller() async {
    emit(const BestSellerState.loading());
    
    final result = await getBestSellerUC.getBestSeller();
    
    result.fold(
      (failure) => emit(BestSellerState.error(failure.message)),
      (response) => emit(BestSellerState.loaded(response)),
    );
  }
}
