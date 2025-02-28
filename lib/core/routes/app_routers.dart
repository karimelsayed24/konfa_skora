import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:konaf_skora/core/routes/router_names.dart';
import 'package:konaf_skora/src/features/auth/presentation/view/register_view.dart';

import '../../src/features/auth/presentation/logic/register/register_cubit.dart';
import '../../src/features/bottom_navigation/bottom_navigation_bar.dart';
import '../../src/features/intro/presentation/view/landing_page.dart';
import '../services/service_locator.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: RouterNames.landing,
      builder: (context, state) => const LandingPageView(),
    ),
    GoRoute(
        path: RouterNames.register,
        builder: (context, state) => BlocProvider(
              create: (context) => getIt<RegisterCubit>(),
              child: const RegisterView(),
            )),
    GoRoute(
      path: RouterNames.bottomNavigationBarRoot,
      builder: (context, state) => const BottomNavigationBarRoot(),
    ),
  ],
);
