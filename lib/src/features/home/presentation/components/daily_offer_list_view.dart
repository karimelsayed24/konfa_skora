
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_assets.dart';
import '../widgets/daily_offer_card_item.dart';

class DailyOffersListView extends StatelessWidget { 
  
  const DailyOffersListView({
    super.key,
    
  }); 

 final List<Map<String, dynamic>> items = 
 const[
    {
      'title': 'كيك شوكولاتة بالفواكه',
      'subtitle': 'وصفة خاصة للمناسبات',
      'price': 290,
      'image':  AppAssets.cake1,
    },
    {
      'title': 'طبق بسبوسة بالقشطة',
      'subtitle': 'حلويات شرقية فاخرة',
      'price': 200,
      'image': AppAssets.cake2,
    },
    {
      'title': 'حلويات متنوعة',
      'subtitle': 'تشكيلة مميزة',
      'price': 350,
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
        itemCount: items.length,
        itemBuilder: (context, index) {
          return DailyOfferCardItem(item: items[index]);
        },
      ),
    );
  }
}