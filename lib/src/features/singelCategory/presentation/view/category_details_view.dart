// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:konaf_skora/core/common/widgets/custom_app_bar.dart';
import 'package:konaf_skora/core/common/widgets/search_widget.dart';
import 'package:konaf_skora/src/features/singelCategory/presentation/componant/category_grid_view_componant.dart';
import 'package:konaf_skora/src/features/singelCategory/presentation/widget/category_taps_widget.dart';
import 'package:konaf_skora/src/features/singelCategory/presentation/widget/filter_dialoge.dart';

class CategoryDetailsView extends StatefulWidget {
  const CategoryDetailsView({super.key});

  @override
  State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> {
  // Filter state variables
  int _sortOption = 0;
  RangeValues _priceRange = const RangeValues(100, 500);

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: const FilterBottomSheet(),
        );
      },
    ).then((value) {
      if (value != null) {
        setState(() {
          _sortOption = value['sortOption'];
          _priceRange = value['priceRange'];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  const CustomAppBar(
                    title: 'الكيك',
                  ),
                  SearchWidget(
                    icon: Icons.filter_list,
                    onPressed: _showFilterBottomSheet,
                  ),
                  SizedBox(height: 20.h),
                  const CategoryTabs(),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            sliver: const CategoryGridViewComponant(),
          ),
        ],
      ),
    );
  }
}
