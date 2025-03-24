
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class CustomTitleInDetails extends StatelessWidget {
  const CustomTitleInDetails({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppStyles.s18.copyWith(
        color: AppColors.textColor,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
