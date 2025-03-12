import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:konaf_skora/core/routes/router_names.dart';
import 'package:konaf_skora/src/features/auth/presentation/view/register_view.dart';
import 'package:konaf_skora/src/features/profile/presentation/view/edit_profile_view.dart';
import 'package:konaf_skora/src/features/support_policy/presentation/logic/questions_cubit.dart';

import '../../src/features/auth/presentation/logic/register/register_cubit.dart';
import '../../src/features/bottom_navigation/bottom_navigation_bar.dart';
import '../../src/features/intro/presentation/view/landing_page.dart';
import '../../src/features/my_orders/presentation/logic/order_details_cubit.dart';
import '../../src/features/my_orders/presentation/logic/orders_cubit.dart';
import '../../src/features/my_orders/presentation/view/my_orders_view.dart';
import '../../src/features/my_orders/presentation/view/order_details_view.dart';
import '../../src/features/notification/presentation/view/notification_view.dart';
import '../../src/features/profile/presentation/logic/change_password_cubit.dart';
import '../../src/features/profile/presentation/logic/profile_cubit.dart';
import '../../src/features/profile/presentation/view/change_password_view.dart';
import '../../src/features/profile/presentation/view/settings_view.dart';
import '../../src/features/support_policy/presentation/view/questions_view.dart';
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
    //edit profile
    GoRoute(
      path: RouterNames.editProfile,
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<ProfileCubit>(),
        child: const EditProfileView(),
      ),
    ),

    GoRoute(
      path: RouterNames.myOrdersView,
      builder: (context, state) => BlocProvider(
          create: (_) => getIt<OrdersCubit>()..getMyOrders(),
          child: const MyOrdersView()),
    ),
    GoRoute(
        path: RouterNames.myOrderDetails,
        builder: (context, state) {
          // final orderId = state.extra ?['orderId'] as int;
          final orderId = state.extra as Map<String, dynamic>;
          return BlocProvider(
            create: (_) =>
                getIt<OrderDetailsCubit>()..getOrderDetails(orderId['orderId']),
            child: const OrderDetailsView(),
          );
        }),
    GoRoute(
      path: RouterNames.notificationPermissionScreen,
      builder: (context, state) => const NotificationsView(),
    ),
    GoRoute(
      path: RouterNames.settingsView,
      builder: (context, state) => const SettingsView(),
    ),
    GoRoute(
      path: RouterNames.supportPolicyView,
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<QuestionsCubit>()..getQuestions(),
        child: const SupportPolicyView(),
      ),
    ),
    GoRoute(
      path: RouterNames.changePassword,
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<ChangePasswordCubit>(),
        child: const ChangePasswordView(),
      ),
    )
  ],
);
