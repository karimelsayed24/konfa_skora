import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:konaf_skora/core/services/service_locator.dart';
import 'package:konaf_skora/core/utils/app_strings.dart';

import '../../../../../core/data/cached/cache_helper.dart';
import '../../../../../core/functions/show_toast.dart';
import '../../../../../core/routes/router_names.dart';
import '../../../../../core/utils/custom_dialog.dart';
import '../logic/profile_cubit.dart';
import '../logic/profile_state.dart';

void showDeleteAccountConfirmation(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) => BlocProvider(
      create: (context) => getIt<ProfileCubit>(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          state.maybeWhen(
            logOutSuccess: (message) {
              Navigator.pop(context);
              showToast(message: message, state: ToastStates.SUCCESS);
              CacheHelper().clearData();

              context.go(RouterNames.landing);
            },
            logOutError: (message) {
              Navigator.pop(context);
              showToast(message: message, state: ToastStates.ERROR);
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return CustomDialog(
            title: AppStrings.deleteAccount,
            subtitle: AppStrings.deleteAccountConfirmation,
            onConfirm: () {
              context.read<ProfileCubit>().deleteAccount();
            },
            onCancel: () {
              context.pop();
            },
          );
        },
      ),
    ),
  );
}
