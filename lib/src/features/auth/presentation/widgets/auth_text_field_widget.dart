import 'package:flutter/material.dart';

import '../../../../../core/common/widgets/custom_text_form_field.dart';
import '../../../../../core/theme/app_colors.dart';

class AuthTextFieldWidget extends StatefulWidget {
  const AuthTextFieldWidget({
    super.key,
    this.titleOfField,
    this.controller,
    required this.isPassword,
    required this.hintText,
    this.prefixIcon,
    this.validator,
    this.sufixIcon,
    this.onPressedSuffix,
    this.maxLines,
  });
  final String? titleOfField;
  final TextEditingController? controller;
  final bool isPassword;
  final String hintText;
  final IconData? prefixIcon;
  final IconData? sufixIcon;
  final void Function()? onPressedSuffix;
  final int? maxLines;
  final FormFieldValidator<String>? validator;

  @override
  State<AuthTextFieldWidget> createState() => _AuthTextFieldWidgetState();
}

class _AuthTextFieldWidgetState extends State<AuthTextFieldWidget> {
  bool _isPasswordVisiable = false;
  void _togglePassword() {
    setState(() {
      _isPasswordVisiable = !_isPasswordVisiable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.controller,
      isPassword: widget.isPassword,
      maxLines: widget.maxLines ?? 1,
      toggleObscure: _togglePassword,
      hintText: widget.hintText,
      prefixIcon: Icon(widget.prefixIcon, color: AppColors.primaryColor),
      validator: widget.validator,
      obscureText: widget.isPassword ? !_isPasswordVisiable : false,
      suffixIcon: widget.isPassword
          ? IconButton(
              onPressed: _togglePassword,
              icon: Icon(
                _isPasswordVisiable ? Icons.visibility : Icons.visibility_off,
                color: AppColors.grey,
              ),
            )
          : widget.sufixIcon != null
              ? IconButton(
                  icon: Icon(widget.sufixIcon, color: AppColors.primaryColor),
                  onPressed: widget.onPressedSuffix,
                  key: null,
                )
              : null,
    );
  }
}
