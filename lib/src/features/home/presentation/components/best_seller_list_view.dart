import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../logic/best_seller/best_seller_cubit.dart';
import '../logic/best_seller/best_seller_state.dart';
import '../widgets/best_seller_card_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestSellerCubit, BestSellerState>(
      builder: (context, state) {
        return state.when(
            initial: () => SizedBox(
                  height: 300.h,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
            loading: () => SizedBox(
                  height: 300.h,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
            error: (error) => SizedBox(
                  height: 300.h,
                  child: Center(
                    child: Text(
                      error,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
            loaded: (bestSellerState) {
              final mostOrdered = bestSellerState.data;

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
                  addAutomaticKeepAlives: true,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  scrollDirection: Axis.horizontal,
                  itemCount: mostOrdered.length,
                  itemBuilder: (context, index) {
                    return BestSellerCardItem(item: mostOrdered[index]);
                  },
                ),
              );
                },
            );
      },
    );
  }
}
