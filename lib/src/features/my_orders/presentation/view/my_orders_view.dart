
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import '../components/my_orders_components.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        actions: [
          IconButton(
            icon:
                const Icon(Icons.arrow_forward_ios, color: AppColors.greyText),
            onPressed: () => context.pop(context),
          ),
        ],
        title: Text(AppStrings.myOrder, style: AppStyles.s22),
      ),
        body: const MyOrdersComponents(),
     
    );
  }
}
