import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/product_details_use_case.dart';
import 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final GetProductDetailsUseCase getProductDetailsUseCase;

  ProductDetailsCubit( this.getProductDetailsUseCase) 
      : super(const ProductDetailsState.initial());

  Future<void> fetchProductDetails(int productId) async {
    emit(const ProductDetailsState.loading());

    final result = await getProductDetailsUseCase.execute( productId);

    result.fold(
      (error) => emit(ProductDetailsState.error(error.message)),
      (productDetails) => emit(ProductDetailsState.loaded(productDetails)),
    );
  }
}