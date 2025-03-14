import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/functions/show_toast.dart';
import '../../../../../core/services/service_locator.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/custom_app_bar.dart';
import '../components/points_components.dart';
import '../logic/prize_product_cubit.dart';
import '../logic/rate/rate_app_cubit.dart';
import '../logic/rate/rate_app_state.dart';
class PointsView extends StatelessWidget {
  const PointsView({super.key});


 @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<PrizeProductsCubit>()..loadAllData(),
        ),
        BlocProvider(
          create: (context) => getIt<RateAppCubit>(),
        ),
      ],
      child: BlocListener<RateAppCubit, RateAppState>(
        listener: (context, state) {
          state.maybeWhen(
            success: (response) {
            showToast(message:  response.msg ,state: ToastStates.SUCCESS);
              
              // Refresh data to update points
              context.read<PrizeProductsCubit>().loadAllData();
            },
            error: (message) {
              showToast(message: message, state: ToastStates.ERROR);
            },
            orElse: () {},
          );
        },
        child: Scaffold(
          appBar: customAppBar(context, AppStrings.points),
          body: const PointsComponents(),
        ),
      ),
    );
  }
}