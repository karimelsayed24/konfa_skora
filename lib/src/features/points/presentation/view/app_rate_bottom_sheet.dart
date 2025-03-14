import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:konaf_skora/core/utils/app_styles.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_strings.dart';

class AppRatingBottomSheet extends StatefulWidget {
  final Function(int) onRateApp;

  const AppRatingBottomSheet({
    super.key,
    required this.onRateApp,
  });

  static Future<void> show(BuildContext context, Function(int) onRateApp) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => AppRatingBottomSheet(onRateApp: onRateApp),
    );
  }

  @override
  State<AppRatingBottomSheet> createState() => _AppRatingBottomSheetState();
}

class _AppRatingBottomSheetState extends State<AppRatingBottomSheet> {
  int _selectedRating = 0;

  void _submitRating() async {
    if (_selectedRating > 0) {
      Navigator.pop(context);
      await widget.onRateApp(_selectedRating);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 39.h),
          SvgPicture.asset(AppAssets.iconForRate),

          SizedBox(height: 22.h),
          Text.rich(
            TextSpan(
              text: AppStrings.rateApp,
              style: AppStyles.s20.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w500,
              ),
              children: [
                TextSpan(
                  text: AppStrings.appName,
                  style: AppStyles.s20.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),

           SizedBox(height: 15.h),

          Text(
            AppStrings.clickStarToRate,
            style: AppStyles.s16.copyWith(
              color: AppColors.greyText,
            ),
          ),
           SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedRating = 5 - index;
                  });
                },
                child: Icon(
                  Icons.star,
                  size: 32,
                  color: _selectedRating >= 5 - index
                      ? AppColors.primaryColor
                      : Colors.grey.shade300,
                ),
              );
            }).reversed.toList(),
          ),
          const SizedBox(height: 24),
          // Action buttons
          Row(
            children: [
           
              Expanded(
                child: TextButton(
                  onPressed: _selectedRating > 3 ? _submitRating : null,
                  style: TextButton.styleFrom(
                    
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9.r),
                    ),
                    backgroundColor: _selectedRating > 3
                        ? AppColors.primaryColor
                        :  AppColors.primaryColor.withOpacity(0.5),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    disabledBackgroundColor:
                        const Color(0xFFF47C7C).withOpacity(0.5),
                  ),
                  child: Text(
                    AppStrings.confirm,
                    style: AppStyles.s16.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    
                  ),
                ),
              ),
              const SizedBox(width: 12),
                 Expanded(
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9.r),
                    ),
                    backgroundColor: Colors.grey.shade200,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child:  Text(
                   AppStrings.cancel,
                   style: AppStyles.s16.copyWith(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                    
                  ),
                ),
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}
