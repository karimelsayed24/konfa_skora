import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:konaf_skora/core/utils/app_styles.dart';

import '../../../../../core/routes/router_names.dart';
import '../../../../../core/theme/app_colors.dart';

class AddressSection extends StatelessWidget {
  const AddressSection(
      {super.key, required this.address, required this.subAddress});
  final String address;
  final String subAddress;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Row(
          children: [
            const Icon(Icons.person_pin, size: 18),
            const SizedBox(width: 4),
            Text(address, style: AppStyles.s16),
          ],
        ),
        subtitle: Text(subAddress, style: AppStyles.s12),
        trailing: InkWell(
        onTap: () =>   context.push(RouterNames.notificationPermissionScreen),
          child: Stack(
            children: [
              Icon(Icons.notifications, size: 24.r, color: AppColors.fillGrey),
              Positioned(
                right: 0,
                top: 0,
                child: CircleAvatar(
                  radius: 5.r,
                  backgroundColor: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ));
  }
}
