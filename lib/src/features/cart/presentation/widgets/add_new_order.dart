import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:konaf_skora/core/routes/router_names.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
context.push(RouterNames.addNewAddressView,);
      },
      icon: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: Colors.green,
            width: 1,
          ),
        ),
        padding: const EdgeInsets.all(2),
        child: const Icon(
          Icons.add,
          size: 12,
          color: Colors.green,
        ),
      ),
      label:  Text(
       AppStrings.addNewAddress,
        style: AppStyles.s14.copyWith(
          color: Colors.green,
        ),
      ),
    );
  }
}
