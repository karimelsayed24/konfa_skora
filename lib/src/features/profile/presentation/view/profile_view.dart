import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import '../components/profile_components.dart';
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Text(AppStrings.profile, style: AppStyles.s22),
      ),
      body:const SafeArea(
        child:  ProfileComponents(),
      ),
    );
  }
}
