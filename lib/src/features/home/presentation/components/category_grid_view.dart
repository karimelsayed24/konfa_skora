
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_assets.dart';
import '../widgets/category_item.dart';

class CategoryGridView extends StatelessWidget {
   CategoryGridView({super.key});
   
  final List<Map<String, dynamic>> _categories = 
  const [
    {'name': 'سلطات', 'image': AppAssets.cake1},
    {'name': 'شوكولاتة', 'image':  AppAssets.cake2},
    {'name': 'كيك', 'image':  AppAssets.cake3},
    {'name': 'حلوى شرقية', 'image':  AppAssets.cake1},
    {'name': 'آيس كريم', 'image':  AppAssets.cake3},
    {'name': 'مشروبات', 'image':  AppAssets.cake2},
  ];
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.9,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return CategoryItem(category: _categories[index]);
        },
        childCount: _categories.length,
      ),
    );
  }
}
