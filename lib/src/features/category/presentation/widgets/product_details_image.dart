import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsIMage extends StatelessWidget {
  const ProductDetailsIMage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl ;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white.withOpacity(0.5),
            Colors.transparent,
          ],
        ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
      },
      blendMode: BlendMode.darken,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: 440.h,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
