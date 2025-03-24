import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konaf_skora/src/features/category/presentation/logic/categories_cubit.dart';
import '../components/all_categories_body.dart';
import '../logic/categories_state.dart';
class CategoriesBody extends StatelessWidget {
  const CategoriesBody({
    super.key, 
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (categories) => AllCategoriesBody(categories : categories ,),
          error: (message) => Center(child: Text(message)),
          orElse: () => const SizedBox(),
        );
      },
    );
  }
}
