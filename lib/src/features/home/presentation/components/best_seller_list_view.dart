
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_assets.dart';
import '../widgets/best_seller_card_item.dart';

class BestSellerListView extends StatelessWidget { 
  
  const BestSellerListView({
    super.key,
    
  }); 

final List<Map<String, dynamic>> _mostOrdered = const   [
    {
      'title': 'كب كيك بالفواكه',
      'subtitle': 'حلويات المناسبات',
      'price': 215,
      'image':  AppAssets.cake1,
    },
    {
      'title': 'كنافة بالمكسرات والقشطة',
      'subtitle': 'وصفة خاصة',
      'price': 230,
      'image':  AppAssets.cake3,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:300.h,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        scrollDirection: Axis.horizontal,
        itemCount: _mostOrdered.length,
        itemBuilder: (context, index) {
          return BestSellerCardItem(item: _mostOrdered[index]);
        },
      ),
    );
  }
}