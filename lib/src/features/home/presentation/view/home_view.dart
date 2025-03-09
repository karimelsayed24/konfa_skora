import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/services/service_locator.dart';
import '../components/home_components.dart';
import '../logic/home_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: BlocProvider(
            create: (context) => getIt<HomeCubit>(),
            child: const HomeComponents(),
          ),
        ),
      ),
    );
  }
}
