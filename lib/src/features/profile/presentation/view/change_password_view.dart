import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konaf_skora/core/functions/show_toast.dart';
import 'package:konaf_skora/core/utils/app_strings.dart';
import 'package:konaf_skora/core/utils/custom_app_bar.dart';

import '../components/change_password_components.dart';
import '../logic/change_password_cubit.dart';
import '../logic/change_password_state.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, AppStrings.changePassword),
      body: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
        listener: (context, state) {
          state.maybeWhen(
            success: (response) {
              showToast(message: response.msg, state: ToastStates.SUCCESS);

              Navigator.pop(context);
            },
            error: (message) {
              showToast(message: message, state: ToastStates.ERROR);
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return ChangePasswordComponents(
              formKey: _formKey,
              oldPasswordController: _oldPasswordController,
              newPasswordController: _newPasswordController,
              confirmPasswordController: _confirmPasswordController);
        },
      ),
    );
  }
}
