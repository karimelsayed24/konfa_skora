import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../logic/home_cubit.dart';
import '../logic/home_state.dart';
import '../widgets/daily_offer_card_item.dart';
class DailyOffersListView extends StatelessWidget {
  const DailyOffersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => previous.dailyOrderState != current.dailyOrderState,
      builder: (context, state) {
        final dailyOrderState = state.dailyOrderState;

        if (dailyOrderState.isLoading) {
          return const Center(child: CircularProgressIndicator(color: AppColors.primaryColor));
        } else if (dailyOrderState.error != null) {
          return Center(child: Text(dailyOrderState.error!.message, style: TextStyle(color: Colors.red, fontSize: 14.sp)));
        } else if (dailyOrderState.data != null) {
          final items = dailyOrderState.data!.data;

          if (items.isEmpty) {
            return const Center(child: Text('لا توجد عروض يومية متاحة حالياً', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)));
          }

          return SizedBox(
            height: 300.h,
            child: ListView.builder(
              cacheExtent: 1000, 
              shrinkWrap: true,
             // physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) => DailyOfferCardItem(item: items[index]),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

// class DailyOffersListView extends StatelessWidget {
//   const DailyOffersListView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<HomeCubit, HomeState>(
//       buildWhen: (previous, current) =>
//           previous.dailyOrderState != current.dailyOrderState,
//       builder: (context, state) {
//         final dailyOrderState = state.dailyOrderState;

//         if (dailyOrderState.isLoading) {
//           return SizedBox(
//             height: 300.h,
//             child: const Center(
//               child: CircularProgressIndicator(
//                 color: AppColors.primaryColor,
//               ),
//             ),
//           );
//         } else if (dailyOrderState.error != null) {
//           return SizedBox(
//             height: 300.h,
//             child: Center(
//               child: Text(
//                 dailyOrderState.error!.message,
//                 style: TextStyle(
//                   color: Colors.red,
//                   fontSize: 14.sp,
//                 ),
//               ),
//             ),
//           );
//         } else if (dailyOrderState.data != null) {
//           final items = dailyOrderState.data!.data;

//           if (items.isEmpty) {
//             return SizedBox(
//               height: 300.h,
//               child: const Center(
//                 child: Text(
//                   'لا توجد عروض يومية متاحة حالياً',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//             );
//           }
//           // return SliverList(
//           //   delegate: SliverChildBuilderDelegate(
//           //     (context, index) => DailyOfferCardItem(item: items[index]),
//           //     childCount: items.length,
//           //   ),
//           // );
//           return SizedBox(
//             height: 300.h,
//             child: ListView.builder(
//                addAutomaticKeepAlives: true,
//                  cacheExtent: 1000, 
//               scrollDirection: Axis.horizontal,
//               padding: EdgeInsets.symmetric(horizontal: 8.w),
//               itemCount: items.length,
//               itemBuilder: (context, index) {
//                 final product = items[index];
//                 return RepaintBoundary(
//             child: DailyOfferCardItem(item: product),
//           );
          
//             },
//           ),
//                     );
//         } else {
//           return SizedBox(
//             height: 300.h,
//           );
//         }
//       },
//     );
//   }
// }
