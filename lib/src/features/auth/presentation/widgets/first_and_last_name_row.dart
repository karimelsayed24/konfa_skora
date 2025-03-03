import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:konaf_skora/core/utils/app_strings.dart';

import '../../../../../core/common/widgets/custom_text_form_field.dart';
import 'auth_text_field_widget.dart';

class FirstAndLastNameRow extends StatelessWidget {
final TextEditingController firstNameController;
  final TextEditingController lastNameController;

  const FirstAndLastNameRow({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Expanded(
          child: AuthTextFieldWidget(
            isPassword: false,
             controller: firstNameController,
            hintText:AppStrings.firstName,
          
          ),
        ),
        SizedBox(width: 5.w),
         Expanded(
          child: AuthTextFieldWidget(
            isPassword: false,
              controller: lastNameController,
            hintText:  AppStrings.lastName,
          ),
        ),
      ],
    );
  }
}