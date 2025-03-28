import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/product_details_body.dart';
import '../logic/product_details_cubit.dart';
import '../logic/product_details_state.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) => Center(child: Text(message)),
            loaded: (productDetails) =>
                ProductDetailsBody(productDetails: productDetails.data ,),
          );
        },
      ),
    );
  }
}
