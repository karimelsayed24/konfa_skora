import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konaf_skora/core/services/service_locator.dart';

import '../../../core/app_cubit/app_cubit.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../home/presentation/view/home_view.dart';
import '../profile/presentation/logic/profile_cubit.dart';
import '../profile/presentation/view/profile_view.dart';

class BottomNavigationBarRoot extends StatelessWidget {
  const BottomNavigationBarRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        final List<Widget> pages = [
          const HomeView(),
          Text('Cart'),
          Text('Points'),
          Text('Track Order'),
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
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: AppStrings.home,
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.shopping_cart,
                  ),
                  label: AppStrings.cart,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.card_giftcard_rounded),
                  label: AppStrings.points,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.share_location),
                  label: AppStrings.trackOrder,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
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
