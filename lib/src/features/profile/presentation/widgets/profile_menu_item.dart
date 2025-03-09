import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routes/router_names.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';

class ProfileMenuItems extends StatelessWidget {
  const ProfileMenuItems({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildMenuItem(Icons.person_outline, AppStrings.editProfile, () {
          context.push(RouterNames.editProfile);
        }),
        _buildMenuItem(Icons.shopping_bag_outlined, AppStrings.myOrder, () {
          context.push(RouterNames.myOrderDetails , extra: {'orderId': 1});
        }),
        _buildMenuItem(
            Icons.notifications_outlined, AppStrings.notification, () {}),
        _buildMenuItem(
            Icons.headset_mic_outlined, AppStrings.privacyPolicy, () {}),
        _buildMenuItem(Icons.settings_outlined, AppStrings.settings, () {}),
        _buildMenuItem(Icons.language_outlined, AppStrings.language, () {}),
        _buildMenuItem(Icons.dark_mode_outlined, AppStrings.darkMode, () {}),
        _buildMenuItem(Icons.logout_outlined, AppStrings.logout, () {}),
      ],
    );
  }

  Widget _buildMenuItem(IconData icon, String title, void Function()? onTap) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Icon(icon, size: 25.r, color: AppColors.iconColor),
            SizedBox(width: 12.w),
            Text(
              title,
              style: AppStyles.s18.copyWith(
                color: AppColors.iconColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Icon(Icons.arrow_forward_ios,
                size: 16.h, color: AppColors.iconColor),
          ],
        ),
      ),
    );
  }
}
