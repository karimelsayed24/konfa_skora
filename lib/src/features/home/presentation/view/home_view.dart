import 'package:flutter/material.dart';

import '../components/best_seller_list_view.dart';
import '../components/category_grid_view.dart';
import '../components/daily_offer_list_view.dart';
import '../widgets/address_section.dart';
import '../widgets/banner_section.dart';
import '../widgets/category_section.dart';
import '../widgets/search_row.dart';
import '../widgets/section_title.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl, // For Arabic
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: AddressSection(
                  address: 'القاهره',
                  subAddress: 'التجمع الخامس , القاهرة ',
                ),
              ),

              const SliverToBoxAdapter(
                child: SearchRow(),
              ),

              const SliverToBoxAdapter(
                child: BannerSection(),
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

              SliverToBoxAdapter(
                child: const BestSellerListView(),
              ),

              const SliverToBoxAdapter(
                child: SizedBox(height: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
