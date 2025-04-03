import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../logic/home_cubit.dart';
import '../logic/home_state.dart';


class BannerSection extends StatefulWidget {
  const BannerSection({super.key});

  @override
  State<BannerSection> createState() => _BannerSectionState();
}

class _BannerSectionState extends State<BannerSection> {
  late PageController _bannerController;
  final ValueNotifier<int> _currentBannerIndex = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    _bannerController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => previous.bannerState != current.bannerState,
      builder: (context, state) {
        final bannerState = state.bannerState;

        if (bannerState.isLoading) {
          return const Center(child: CircularProgressIndicator(color: AppColors.primaryColor));
        } else if (bannerState.error != null) {
          return Center(
            child: Text(bannerState.error!.message, style: TextStyle(color: Colors.red, fontSize: 14.sp)),
          );
        } else if (bannerState.data != null) {
          final banners = bannerState.data!.data;
          return SizedBox(
            height: 200.h,
            child: Stack(
              children: [
                PageView.builder(
                  controller: _bannerController,
                  itemCount: banners.length,
                  onPageChanged: (int index) => _currentBannerIndex.value = index,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(12.r),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(9.r)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(9.r),
                        child: CachedNetworkImage(
                          imageUrl: banners[index].image,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            color: AppColors.grey.withOpacity(0.3),
                            child: const Center(child: CircularProgressIndicator(color: AppColors.primaryColor)),
                          ),
                          errorWidget: (context, url, error) => Container(
                            color: AppColors.grey.withOpacity(0.3),
                            child: const Icon(Icons.error, color: Colors.red),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Positioned(
                  bottom: 15,
                  left: 0,
                  right: 0,
                  child: ValueListenableBuilder<int>(
                    valueListenable: _currentBannerIndex,
                    builder: (context, index, child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          banners.length,
                          (index) => Container(
                            width: 8.w,
                            height: 8.h,
                            margin: EdgeInsets.symmetric(horizontal: 2.w),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentBannerIndex.value == index ? AppColors.primaryColor : AppColors.grey,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  @override
  void dispose() {
    _bannerController.dispose();
    super.dispose();
  }
}
// class BannerSection extends StatefulWidget {
//   const BannerSection({super.key});

//   @override
//   State<BannerSection> createState() => _BannerSectionState();
// }

// class _BannerSectionState extends State<BannerSection> {
//   final PageController _bannerController = PageController();
//   int _currentBannerIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<HomeCubit, HomeState>(
//       buildWhen: (previous, current) => previous.bannerState != current.bannerState,
//       builder: (context, state) {
//         final bannerState = state.bannerState;
        
//         if (bannerState.isLoading) {
//           return const Center(
//             child: CircularProgressIndicator(
//               color: AppColors.primaryColor,
//             ),
//           );
//         } else if (bannerState.error != null) {
//           return Center(
//             child: Text(
//               bannerState.error!.message,
//               style: TextStyle(
//                 color: Colors.red,
//                 fontSize: 14.sp,
//               ),
//             ),
//           );
//         } else if (bannerState.data != null) {
//           final banners = bannerState.data!.data;
//           return SizedBox(
//             height: 200.h,
//             child: Stack(
//               children: [
//                 PageView.builder(
//                   controller: _bannerController,
//                   itemCount: banners.length,
//                   onPageChanged: (int index) {
//                     setState(() {
//                       _currentBannerIndex = index;
//                     });
//                   },
//                   itemBuilder: (context, index) {
//                     final banner = banners[index];
                    
//                     return Container(
//                       margin: EdgeInsets.all(12.r),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(9.r),
//                       ),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(9.r),
//                         child: CachedNetworkImage(
//                           imageUrl: banner.image,
//                           memCacheWidth: 400,
//                           fit: BoxFit.cover,
//                           placeholder: (context, url) => Container(
//                             color: AppColors.grey.withOpacity(0.3),
//                             child: const Center(
//                               child: CircularProgressIndicator(
//                                 color: AppColors.primaryColor,
//                               ),
//                             ),
//                           ),
//                           errorWidget: (context, url, error) => Container(
//                             color: AppColors.grey.withOpacity(0.3),
//                             child: const Icon(
//                               Icons.error,
//                               color: Colors.red,
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//                 Positioned(
//                   bottom: 15,
//                   left: 0,
//                   right: 0,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: List.generate(
//                       banners.length,
//                       (index) => Container(
//                         width: 8.w,
//                         height: 8.h,
//                         margin: EdgeInsets.symmetric(horizontal: 2.w),
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: _currentBannerIndex == index
//                               ? AppColors.primaryColor
//                               : AppColors.grey,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         } else {
//           return const SizedBox.shrink();
//         }
//       },
//     );
//   }

//   @override
//   void dispose() {
//     _bannerController.dispose();
//     super.dispose();
//   }
// }