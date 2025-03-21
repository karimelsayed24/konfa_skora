
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/custom_app_bar.dart';
import '../components/my_orders_components.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          backgroundColor: Colors.white,
     appBar: customAppBar(context, AppStrings.myOrder),
      
        body: const MyOrdersComponents(),
     
    );
  }
}
