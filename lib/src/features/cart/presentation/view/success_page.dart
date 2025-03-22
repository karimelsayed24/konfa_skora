import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:konaf_skora/core/utils/app_strings.dart';

import '../../../../../core/common/widgets/custom_btn.dart';
import '../../../../../core/utils/app_assets.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
           // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
                children: [
          SvgPicture.asset(AppAssets.successIcon),
          SizedBox(height: 40.h),
          Text(
            AppStrings.thanks,
            style: TextStyle(fontSize: 24.sp),
          ),
          SizedBox(height: 40.h),
          CustomButton(
            text: 'تتبع طلبك',
            onPressed: () {},
          )
                ],
              ),
        ));
  }
}
