import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:konaf_skora/core/routes/router_names.dart';
import 'package:konaf_skora/src/features/auth/presentation/view/register_view.dart';
import 'package:konaf_skora/src/features/category/presentation/logic/categories_products_cubit.dart';
import 'package:konaf_skora/src/features/profile/presentation/view/edit_profile_view.dart';
import 'package:konaf_skora/src/features/support_policy/presentation/logic/questions_cubit.dart';

import '../../src/features/auth/presentation/logic/password_reset_cubit.dart';
import '../../src/features/auth/presentation/logic/register/register_cubit.dart';
import '../../src/features/auth/presentation/logic/set_location/set_location_cubit.dart';
import '../../src/features/auth/presentation/view/forget_password_view.dart';
import '../../src/features/auth/presentation/view/reset_password_view.dart';
import '../../src/features/auth/presentation/view/verify_otp_view.dart';
import '../../src/features/bottom_navigation/bottom_navigation_bar.dart';
import '../../src/features/cart/data/model/cart_response_model.dart';
import '../../src/features/cart/presentation/view/check_out_view.dart';
import '../../src/features/cart/presentation/view/success_page.dart';
import '../../src/features/category/data/model/category_model.dart';
import '../../src/features/category/presentation/logic/categories_cubit.dart';
import '../../src/features/category/presentation/logic/product_details_cubit.dart';
import '../../src/features/category/presentation/view/categories_product_view.dart';
import '../../src/features/category/presentation/view/categories_view.dart';
import '../../src/features/category/presentation/view/product_details_view.dart';
import '../../src/features/intro/presentation/view/landing_page.dart';
import '../../src/features/location/presentation/logic/address_cubit.dart';
import '../../src/features/auth/presentation/view/set_location_selector_view.dart';
import '../../src/features/location/presentation/view/add_new_address_view.dart';
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
      path: RouterNames.resetPasswordView,
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<PasswordResetCubit>(),
        child: const ResetPasswordView(),
      ),
    ),

    GoRoute(
      path: RouterNames.verifyOtpView,
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<PasswordResetCubit>(),
        child: const VerifyOtpView(),
      ),
    ),

    GoRoute(
      path: RouterNames.forgetPasswordView,
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<PasswordResetCubit>(),
        child: const ForgetPasswordView(),
      ),
    ),

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
      path: RouterNames.productDetailsView,
      builder: (context, state) {
        final productId = state.extra as int;
        return BlocProvider(
          create: (context) => getIt<ProductDetailsCubit>()
            ..fetchProductDetails(productId),
          child: ProductDetailsView( ),
        );
      },
      
    ),

    GoRoute(
      path: RouterNames.categoriesView,
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<CategoriesCubit>()..getCategories(),
        child: const CategoriesView(),
      ),
    ),
     GoRoute(
      path: RouterNames.categoryProductsView,
      builder: (context, state) {
        final category = state.extra as CategoryModel;
        return BlocProvider(
          create: (context) => getIt<CategoryProductsCubit>()..getProducts(category: category),
          child: CategoryProductView(category: category),
        );
      },
     ),

    GoRoute(
      path: RouterNames.settingsView,
      builder: (context, state) => const SettingsView(),
    ),

    GoRoute(
      path: RouterNames.successPage,
      builder: (context, state) => const SuccessPage(),
    ),

    GoRoute(
        path: RouterNames.addNewAddressView,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => getIt<AddressCubit>(),
            child: const AddNewAddressView(),
          );
        }),

    GoRoute(
        path: RouterNames.checkoutView,
        builder: (context, state) {
          final cartData = state.extra as CartData;

          return BlocProvider(
            create: (context) => getIt<AddressCubit>(),
            child: CheckoutView(
              cartData: cartData,
            ),
          );
        }),
    GoRoute(
      path: RouterNames.locationSelectorView,
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<SetLocationCubit>(),
        child: const SetLocationSelectorView(),
      ),
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
