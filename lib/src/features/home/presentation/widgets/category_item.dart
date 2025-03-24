

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../category/data/model/category_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
final VoidCallback onTap;
  const CategoryItem({
    super.key,
    required this.category, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
      return GestureDetector(
       onTap: onTap,
      child: Column(
        //  mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(11.r),
              child: CachedNetworkImage(
                imageUrl:  category.image ?? 'http://127.0.0.1:8000/default.png',
              height: 110.h,
              width: 125.w,
                
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          
            const SizedBox(height: 10),
            Text(
              category.name,
              style: AppStyles.s14
            ),
          ],
        
      ),
    );
  }
}
