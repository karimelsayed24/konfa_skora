import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routes/router_names.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/custom_app_bar.dart';
import '../widgets/delete_account_dialog.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, AppStrings.settings),
      body: ListView(
        children: [
          SizedBox(height: 12.h),
          BuildSettingItem(
            icon: Icons.lock,
            title: AppStrings.changePassword,
            onTap: () {
              context.push(RouterNames.changePassword);
            },
          ),
          Divider(
            color: AppColors.lightGrey,
            thickness: 1.h,
          ),
          BuildSettingItem(
            icon: Icons.share,
            title: AppStrings.language,
            onTap: () {},
          ),
          Divider(
            color: AppColors.lightGrey,
            thickness: 1.h,
          ),
          BuildSettingItem(
            icon: Icons.delete_outlined,
            title: AppStrings.deleteAccount,
            onTap: () =>showDeleteAccountConfirmation(context),
          ),
        ],
      ),
    );
  }
}

class BuildSettingItem extends StatelessWidget {
  const BuildSettingItem(
      {super.key, required this.icon, required this.title, this.onTap});
  final IconData icon;
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Icon(icon, size: 25.r, color: AppColors.primaryColor),
            SizedBox(width: 12.w),
            Text(
              title,
              style: AppStyles.s18.copyWith(
                color: AppColors.iconColor,
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Icon(Icons.arrow_forward_ios,
                size: 16.h, color: AppColors.primaryColor),
          ],
        ),
      ),
    );
  }
}
