import 'package:flutter/material.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/custom_app_bar.dart';
import '../components/reset_password_body.dart';


class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, AppStrings.resetPassword),
      body: ResetPasswordBody(
          formKey: _formKey,
          passwordController: passwordController,
          confirmPasswordController: confirmPasswordController),
    );
  }
}
