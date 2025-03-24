import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_strings.dart';
import '../components/best_seller_list_view.dart';
import '../components/category_grid_view.dart';
import '../components/daily_offer_list_view.dart';
import '../logic/home_cubit.dart';
import '../widgets/address_section.dart';
import '../widgets/banner_section.dart';
import '../widgets/category_section.dart';
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
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: AddressSection(
            address: AppStrings.welcome,
            subAddress: AppStrings.welcomeToKonafaSokar,
          ),
        ),

      
        SliverToBoxAdapter(
          child: BannerSection(),
        ),

        SliverToBoxAdapter(
          child: CategorySection(),
        ),

        SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            sliver: CategoriesInHome(),
            ),

        SliverToBoxAdapter(
          child: SectionTitle(title: AppStrings.dailyOffers),
        ),

        SliverToBoxAdapter(
          child: DailyOffersListView(),
        ),

        SliverToBoxAdapter(
          child: SectionTitle(title: AppStrings.bestSeller),
        ),

        SliverToBoxAdapter(
          child: BestSellerListView(),
        ),

        SliverToBoxAdapter(
          child: SizedBox(height: 20),
        ),
      ],
    );
  }
}
