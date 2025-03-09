import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_assets.dart';

class ImageColumn extends StatelessWidget {
  const ImageColumn({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return image.isEmpty
        ? ClipRRect(
            borderRadius: BorderRadius.circular(14.r),
            child: SizedBox(
              width: 110.w,
              height: 110.w,
              child: Image.asset(
                AppAssets.cake1,
                fit: BoxFit.cover,
              ),
            ),
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: CachedNetworkImage(
              imageUrl: image,
              width: 110.w,
              height: 110.w,
              
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          );
  }
}
