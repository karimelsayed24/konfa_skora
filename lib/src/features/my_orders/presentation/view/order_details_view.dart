import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/custom_app_bar.dart';
import '../logic/order_details_cubit.dart';
import '../logic/order_details_state.dart';
import '../widgets/build_order_details.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, AppStrings.myOrderDetails),
      body: BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) => Center(child: Text('خطأ: $message')),
            loaded: (orderDetails) =>
                BuildOrderDetails(orderDetails: orderDetails),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
