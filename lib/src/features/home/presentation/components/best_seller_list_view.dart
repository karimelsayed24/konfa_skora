import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../logic/home_cubit.dart';
import '../logic/home_state.dart';
import '../widgets/best_seller_card_item.dart';
class BestSellerListView extends StatefulWidget {
  const BestSellerListView({super.key});

  @override
  State<BestSellerListView> createState() => _BestSellerListViewState();
}

class _BestSellerListViewState extends State<BestSellerListView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => previous.bestSellerState != current.bestSellerState,
      builder: (context, state) {
        final bestSellerState = state.bestSellerState;
        
        if (bestSellerState.isLoading) {
          return SizedBox(
            height: 300.h,
            child: const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            ),
          );
        } else if (bestSellerState.error != null) {
          return SizedBox(
            height: 300.h,
            child: const Center(
              child: Text(
                'حدث خطأ ما، يرجى المحاولة مرة أخرى',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        } else if (bestSellerState.data != null) {
          final mostOrdered = bestSellerState.data!.data;
          
          if (mostOrdered.isEmpty) {
            return SizedBox(
              height: 300.h,
              child: const Center(
                child: Text(
                  'لا توجد منتجات متاحة حالياً',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          }
          
          return SizedBox(
            height: 300.h,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              scrollDirection: Axis.horizontal,
              itemCount: mostOrdered.length,
              itemBuilder: (context, index) {
                return BestSellerCardItem(item: mostOrdered[index]);
              },
            ),
          );
        } else {
          return SizedBox(
            height: 300.h,
          );
        }
      },
    );
  }
}
