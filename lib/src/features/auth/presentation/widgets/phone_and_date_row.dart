import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:konaf_skora/core/common/functions/validator.dart';

import '../../../../../core/common/widgets/custom_text_form_field.dart';
import '../../../../../core/utils/app_strings.dart';
import 'auth_text_field_widget.dart';

class PhoneAndDateRow extends StatelessWidget {
  const PhoneAndDateRow({super.key, required this.phoneController, required this.dateController});
final TextEditingController phoneController;
final TextEditingController dateController;
  @override
  Widget build(BuildContext context) {
 return Row(
      children: [
         Expanded(
          child: AuthTextFieldWidget(
            isPassword: false,
             controller: phoneController,
            hintText: AppStrings.phone,
            validator: Validator.validatePhone,
          
          ),
        ),
        SizedBox(width: 5.w),
         Expanded(
          child: AuthTextFieldWidget(
            isPassword: false,
              controller: dateController,
            hintText: AppStrings.birthday,
          ),
        ),
      ],
    );  }
}