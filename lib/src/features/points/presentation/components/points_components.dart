import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../auth/presentation/widgets/create_account_title.dart';
import '../logic/prize_product_cubit.dart';
import '../logic/prize_products_state.dart';
import '../widgets/points_earned_container.dart';
import 'extra_points_components.dart';
import 'rewards_components.dart';

class PointsComponents extends StatelessWidget {
  const PointsComponents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrizeProductsCubit, PrizeProductsState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox(),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (message) => Center(child: Text(message)),
          loaded: (prizeProductsResponse, extraPointsOptionsResponse,
              userPointsResponse) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CreateAccountTitle(
                      title: AppStrings.collectAndWin,
                      subTitle: AppStrings.collectPointsAndWin,
                    ),
                    SizedBox(height: 22.h),
                    PointsEarnedContainer(
                        points: userPointsResponse.data.points),
                    SizedBox(height: 20.h),
                    RewardsComponents(
                        prizeProductsResponse: prizeProductsResponse),
                    SizedBox(height: 20.h),
                    ExtraPointsComponents(
                        extraPointsOptionsResponse: extraPointsOptionsResponse),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
