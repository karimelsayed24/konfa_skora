import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/services/service_locator.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/custom_app_bar.dart';
import '../components/points_components.dart';
import '../logic/prize_product_cubit.dart';


class PointsView extends StatelessWidget {
  const PointsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PrizeProductsCubit>()..loadAllData(),
      child: Scaffold(
        appBar: customAppBar(context, AppStrings.points),
        body: const PointsComponents(),
      ),
    );
  }
}
