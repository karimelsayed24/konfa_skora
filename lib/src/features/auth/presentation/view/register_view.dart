//registerView

import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../components/register_form.dart';
import '../widgets/register_app_bar.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: const RegisterAppBar(primaryText: '1', secondaryText: '| 2'),
      ),
      body:  const RegisterForm(),
      
    );
  }
}
