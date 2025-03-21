import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konaf_skora/core/services/service_locator.dart';

import '../../../../../core/utils/app_strings.dart';
import '../components/best_seller_list_view.dart';
import '../components/category_grid_view.dart';
import '../components/daily_offer_list_view.dart';
import '../logic/home_cubit.dart';
import '../widgets/address_section.dart';
import '../widgets/banner_section.dart';
import '../widgets/category_section.dart';
import '../widgets/search_row.dart';
import '../widgets/section_title.dart';

class HomeComponents extends StatefulWidget {
  const HomeComponents({
    super.key,
  });

  @override
  State<HomeComponents> createState() => _HomeComponentsState();
}

class _HomeComponentsState extends State<HomeComponents> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().loadAllHomeData();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: AddressSection(
            address: AppStrings.welcome,
            subAddress: AppStrings.welcomeToKonafaSokar,
          ),
        ),

        const SliverToBoxAdapter(
          child: SearchRow(),
        ),

       const SliverToBoxAdapter(
          child:  BannerSection(),
        ),

        const SliverToBoxAdapter(
          child: CategorySection(),
        ),

        // Categories grid
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: CategoryGridView(),
        ),

        const SliverToBoxAdapter(
          child: SectionTitle(title: 'العروض اليومية'),
        ),

        const SliverToBoxAdapter(
          child: DailyOffersListView(),
        ),

        const SliverToBoxAdapter(
          child: SectionTitle(title: 'الأكثر طلبا'),
        ),

        const SliverToBoxAdapter(
          child: BestSellerListView(),
        ),

        const SliverToBoxAdapter(
          child: SizedBox(height: 20),
        ),
      ],
    );
  }
}
