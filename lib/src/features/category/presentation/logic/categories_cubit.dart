import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/get_categories_use_case.dart';
import 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final GetCategoriesUseCase getCategoriesUseCase;

  CategoriesCubit( this.getCategoriesUseCase)
      : super(const CategoriesState.initial());

  Future<void> getCategories() async {
    emit(const CategoriesState.loading());
    
    final result = await getCategoriesUseCase.execute();
    
    result.fold(
      (error) => emit(CategoriesState.error(error.message)),
      (categories) => emit(CategoriesState.loaded(categories)),
    );
  }
}