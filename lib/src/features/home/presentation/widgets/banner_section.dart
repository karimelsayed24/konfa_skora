import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:konaf_skora/core/theme/app_colors.dart';
import 'package:konaf_skora/core/utils/app_styles.dart';
import '../../../../../core/utils/app_assets.dart';

class BannerSection extends StatefulWidget {
  const BannerSection({
    super.key,
  });

  @override
  State createState() => _BannerSectionState();
}

class _BannerSectionState extends State {
  final PageController _bannerController = PageController();
  int _currentBannerIndex = 0;

  final List<Map<String, dynamic>> _bannerImages = [
    {
      'image': AppAssets.cake1,
      'title': 'اشترك في باقة والسعادة',
      'hasGradient': true,
    },
    {
      'image': AppAssets.cake3,
      'title': 'هأأأأأاااأأأأ',
      'hasGradient': true,
    },
    {
      'image': AppAssets.cake2,
      'title': 'هأأأأأأأأأ',
      'hasGradient': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Stack(
        children: [
          PageView.builder(
            controller: _bannerController,
            itemCount: _bannerImages.length,
            onPageChanged: (int index) {
              setState(() {
                _currentBannerIndex = index;
              });
            },
            itemBuilder: (context, index) {
              final bannerData = _bannerImages[index];
              return Container(
                margin: EdgeInsets.all(12.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.r),
                  image: DecorationImage(
                    image: AssetImage(bannerData['image']),
                    fit: BoxFit.fill,
                  ),
                ),
                child: bannerData['hasGradient']
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.r),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Colors.black54],
                          ),
                        ),
                        alignment: Alignment.bottomRight,
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          bannerData['title'],
                          style: AppStyles.s18.copyWith(
                            color: AppColors.lightGrey,
                            fontWeight: FontWeight.bold,
                          ),
                          // const TextStyle(
                          //   color: AppColors.lightGrey,
                          //   fontWeight: FontWeight.bold,
                          //   fontSize: 18,
                          // ),
                        ),
                      )
                    : null,
              );
            },
          ),
          Positioned(
            bottom: 15,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _bannerImages.length,
                (index) => Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentBannerIndex == index
                        ? AppColors.primaryColor
                        : AppColors.grey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}