import 'package:flutter/material.dart';
import '../../../../../core/utils/app_strings.dart';
import '../components/best_seller_list_view.dart';
import '../components/category_grid_view.dart';
import '../components/daily_offer_list_view.dart';
import '../widgets/address_section.dart';
import '../widgets/banner_section.dart';
import '../widgets/category_section.dart';
import '../widgets/section_title.dart';

class HomeComponents extends StatelessWidget {
  const HomeComponents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: AddressSection(
            address: AppStrings.welcome,
            subAddress: AppStrings.welcomeToKonafaSokar,
          ),
        ),
        const SliverToBoxAdapter(
          child: BannerSection(),
        ),
        const SliverToBoxAdapter(
          child: CategorySection(),
        ),
        const CategoriesInHome(),
        SliverToBoxAdapter(
          child: SectionTitle(title: AppStrings.dailyOffers),
        ),
        const SliverToBoxAdapter(
          child: DailyOffersListView(),
        ),
        SliverToBoxAdapter(
          child: SectionTitle(title: AppStrings.bestSeller),
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
