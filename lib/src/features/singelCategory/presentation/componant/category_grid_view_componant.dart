import 'package:flutter/material.dart';
import 'package:konaf_skora/core/utils/app_assets.dart';
import 'package:konaf_skora/src/features/singelCategory/presentation/widget/item_card_widget.dart';

class CategoryGridViewComponant extends StatelessWidget {
  const CategoryGridViewComponant({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> cakes = [
      {
        'title': 'كيك شوكولاتة بالفراولة',
        'price': 2500.0,
        'imageUrl': AppAssets.cake,
      },
      {
        'title': 'كيك فانيليا لوتس',
        'price': 2800.0,
        'imageUrl': AppAssets.cake1,
      },
      {
        'title': 'كيك الشوكولاتة',
        'price': 2400.0,
        'imageUrl': AppAssets.cake2,
      },
      {
        'title': 'كيك فانيليا بالتوت',
        'price': 2300.0,
        'imageUrl': AppAssets.cake3,
      },
      {
        'title': 'كيك الشوكولاتة',
        'price': 2400.0,
        'imageUrl': AppAssets.cake2,
      },
      {
        'title': 'كيك فانيليا بالتوت',
        'price': 2300.0,
        'imageUrl': AppAssets.cake3,
      },
    ];

    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: cakes.length,
      itemBuilder: (context, index) {
        return ItemCardWidget(
          title: cakes[index]['title'],
          price: cakes[index]['price'],
          imageUrl: cakes[index]['imageUrl'],
        );
      },
    );
  }
}
