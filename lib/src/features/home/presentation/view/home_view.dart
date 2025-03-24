import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konaf_skora/src/features/home/presentation/logic/favorite/favorite_cubit.dart';

import '../../../../../core/services/service_locator.dart';
import '../../../category/presentation/logic/categories_cubit.dart';
import '../components/home_components.dart';
import '../logic/home_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getIt<HomeCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt<FavoriteCubit>(),
            ),
            BlocProvider(
        create: (context) => getIt<CategoriesCubit>()..getCategories(),
            )
          ],
          child: const HomeComponents(),
        ),
      ),
    );
  }
}
