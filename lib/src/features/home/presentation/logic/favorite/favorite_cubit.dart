
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/add_to_favorite_use_case.dart';
import 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final AddToFavoriteUseCase addFavoriteUseCase;
  
  FavoriteCubit( this.addFavoriteUseCase) 
      : super(const FavoriteState.initial());
  
  Future<void> addFavorite(int productId) async {
    emit(const FavoriteState.loading());
    
    final result = await addFavoriteUseCase.addToFavorite(productId);
    
    result.fold(
      (failure) => emit(FavoriteState.error(failure.message)),
      (response) => emit(FavoriteState.loaded(response)),
    );
  }
}
