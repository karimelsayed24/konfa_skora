import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konaf_skora/core/services/service_locator.dart';
import 'package:konaf_skora/src/features/cart/presentation/logic/cart_cubit.dart';

import '../../../core/app_cubit/app_cubit.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../cart/presentation/view/cart_view.dart';
import '../category/presentation/logic/categories_cubit.dart';
import '../home/presentation/logic/best_seller/best_seller_cubit.dart';
import '../home/presentation/logic/favorite/favorite_cubit.dart';
import '../home/presentation/logic/home_cubit.dart';
import '../home/presentation/view/home_view.dart';
import '../points/presentation/view/points_view.dart';
import '../profile/presentation/logic/profile_cubit.dart';
import '../profile/presentation/view/profile_view.dart';

class BottomNavigationBarRoot extends StatelessWidget {
  const BottomNavigationBarRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        final List<Widget> pages = [
          MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) => getIt<HomeCubit>()..loadAllHomeData(),
            ),
            BlocProvider(
              create: (context) => getIt<FavoriteCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt<BestSellerCubit>()..getBestSeller(),
            ),
            BlocProvider(
              create: (context) => getIt<CategoriesCubit>()..getCategories(),
            )
          ], child: const HomeView()),
          BlocProvider(
            create: (context) => getIt<CartCubit>()..getCartItems(),
            child: const CartView(),
          ),
          const PointsView(),
          // BlocProvider(
          //   create: (context) => getIt<AddressCubit>(),
          //   child: const SetLocationSelectorView(),
          // ),
          BlocProvider(
            create: (context) => getIt<ProfileCubit>(),
            child: const ProfileView(),
          ),
        ];
        return Scaffold(
          backgroundColor: AppColors.lightGrey,
          body: SafeArea(
            bottom: false,
            child: pages[state.bottomNavBarSelectedIndex],
          ),
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: AppColors.lightGrey, width: 1.5),
              ),
            ),
            child: BottomNavigationBar(
              showSelectedLabels: true,
              type: BottomNavigationBarType.shifting,
              selectedItemColor: AppColors.primaryColor,
              unselectedItemColor: AppColors.lightColor,
              showUnselectedLabels: false,
              backgroundColor: AppColors.white,
              elevation: 2,
              currentIndex: state.bottomNavBarSelectedIndex,
              onTap: (index) => context
                  .read<AppCubit>()
                  .changeBottomNavBarSelectedIndex(index),
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(Icons.home),
                  label: AppStrings.home,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(
                    Icons.shopping_cart,
                  ),
                  label: AppStrings.cart,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.card_giftcard_rounded),
                  label: AppStrings.points,
                ),
                // BottomNavigationBarItem(
                //   icon: Icon(Icons.share_location),
                //   label: AppStrings.trackOrder,
                // ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.person),
                  label: AppStrings.profile,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
