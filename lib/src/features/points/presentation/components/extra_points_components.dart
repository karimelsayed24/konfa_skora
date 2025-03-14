import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../data/model/prize_products_response.dart';
import '../logic/rate/rate_app_cubit.dart';
import '../view/app_rate_bottom_sheet.dart';
import '../widgets/invite_friends_card.dart';
import '../../../../../../core/utils/app_strings.dart';

class ExtraPointsComponents extends StatelessWidget {
  const ExtraPointsComponents({
    super.key,
    required this.extraPointsOptionsResponse,
  });
  final ExtraPointsOptionsResponse extraPointsOptionsResponse;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.earnExtraPoints,
            style: AppStyles.s20.copyWith(
              color: AppColors.textColor,
              fontWeight: FontWeight.w500,
            )),
        SizedBox(height: 10.h),
        ...extraPointsOptionsResponse.data
            .where((option) =>
                option.key == 'points_per_friend_invitation' ||
                option.key == 'points_per_app_rating')
            .map(
              (option) => InviteFriendsCard(
                onInvite: () {
                  if (option.key == 'points_per_friend_invitation') {
                    // _inviteFriends(context);
                  } else if (option.key == 'points_per_app_rating') {
                    _showRatingBottomSheet(context);
                  }
                },
                option: option,
              ),
            ),
      ],
    );
  }

  void _showRatingBottomSheet(BuildContext context) {
    // Show the rating bottom sheet
    AppRatingBottomSheet.show(
      context,
      (rating) async {
        final rateAppCubit = context.read<RateAppCubit>();

        await rateAppCubit.rateApp();
      },
    );
  }
}
