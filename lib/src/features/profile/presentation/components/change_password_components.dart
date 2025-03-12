import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/functions/validator.dart';
import '../../../../../core/common/widgets/custom_btn.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../auth/presentation/widgets/auth_text_field_widget.dart';
import '../logic/change_password_cubit.dart';

class ChangePasswordComponents extends StatelessWidget {
  const ChangePasswordComponents({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController oldPasswordController,
    required TextEditingController newPasswordController,
    required TextEditingController confirmPasswordController,
  })  : _formKey = formKey,
        _oldPasswordController = oldPasswordController,
        _newPasswordController = newPasswordController,
        _confirmPasswordController = confirmPasswordController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _oldPasswordController;
  final TextEditingController _newPasswordController;
  final TextEditingController _confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              AppStrings.currentPassword,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.h),
            AuthTextFieldWidget(
              hintText: AppStrings.currentPassword,
              controller: _oldPasswordController,
              isPassword: true,
              validator: Validator.validatePassword,
            ),
             SizedBox(height: 16.h),
            const Text(
              AppStrings.newPassword,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.h),
            AuthTextFieldWidget(
              hintText: AppStrings.newPassword,
              controller: _newPasswordController,
              isPassword: true,
              validator: Validator.validatePassword,
            ),
             SizedBox(height: 16.h),
            const Text(
              AppStrings.confirmPassword,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.h),
            AuthTextFieldWidget(
              hintText: AppStrings.confirmPassword,
              controller: _confirmPasswordController,
              isPassword: true,
              validator: (value) {
                if (value != _newPasswordController.text) {
                  return 'كلمة المرور غير متطابقة';
                }
                return null;
              },
            ),
            const SizedBox(height: 32),
            CustomButton(
              text: AppStrings.save,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<ChangePasswordCubit>().changePassword(
                        oldPassword: _oldPasswordController.text,
                        password: _newPasswordController.text,
                        passwordConfirmation: _confirmPasswordController.text,
                      );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
