import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/widgets/no_order_found.dart';
import '../../../../../core/theme/app_colors.dart';
import '../logic/orders_cubit.dart';
import '../logic/orders_states.dart';
import '../widgets/my_order_card.dart';

class MyOrdersComponents extends StatelessWidget {
  const MyOrdersComponents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        if (state is OrdersLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is OrdersLoaded) {
          return state.orders.data.isEmpty
              ? const NoOrderFound()
              : ListView.builder(
                  itemCount: state.orders.data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 16.h),
                      child: OrderCard(order: state.orders.data[index]),
                    );
                  },
                );
        } else if (state is OrdersError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error,
                    size: 48, color: AppColors.primaryColor),
                const SizedBox(height: 16),
                Text(
                  state.message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => context.read<OrdersCubit>().getMyOrders(),
                  child: const Text('إعادة المحاولة'),
                ),
              ],
            ),
          );
        }
        return Center(
          child: Column(
            children: [
              Icon(Icons.add_shopping_cart_outlined,
                  size: 120.r, color: AppColors.grey),
            ],
          ),
        );
      },
    );
  }
}
