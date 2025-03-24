import 'package:flutter/material.dart';
import 'package:konaf_skora/core/utils/custom_app_bar.dart';
import '../../../../../core/utils/app_strings.dart';
import '../components/categories_body.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, AppStrings.categories),
      body: const CategoriesBody(),
    );
  }
}
