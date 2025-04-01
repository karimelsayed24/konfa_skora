
import 'package:flutter/material.dart';

import '../../../../../core/common/widgets/custom_btn.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../auth/presentation/widgets/create_account_title.dart';

class NotificationPermissionComponents extends StatelessWidget {
  const NotificationPermissionComponents({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: screenHeight * 0.05),
           CreateAccountTitle(
            title: AppStrings.allNotifications,
            subTitle: AppStrings.allowAllNotificationFromApp,
          ),
          SizedBox(height: screenHeight * 0.07),
          Center(
            child: Image.asset(
              AppAssets.noNotification, 
            ),
          ),
          SizedBox(height: screenHeight * 0.05),
    
          const Text(
            'السماح للتطبيق بإرسال الإشعارات',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF666666),
            ),
            textAlign: TextAlign.center,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'السماح بإرسال جميع الإشعارات الخاصة بالتطبيق والتنبيهات',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFFAAAAAA),
              ),
              textAlign: TextAlign.center,
            ),
          ),
    
          const Spacer(),
          CustomButton(
            onPressed: () {},
            text: 'السماح بالإشعارات',
          ),
    
          TextButton(
            onPressed: () {},
            child: const Text(
              'ربما لاحقا',
              style: TextStyle(
                color: Color(0xFFAAAAAA),
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.05),
        ],
      ),
    );
  }
}
