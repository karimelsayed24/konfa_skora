import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:konaf_skora/core/routes/router_names.dart';

import '../../../../../core/common/functions/validator.dart';
import '../../../../../core/common/widgets/custom_btn.dart';
import '../../../../../core/functions/show_toast.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/custom_app_bar.dart';
import '../logic/password_reset_cubit.dart';
import '../logic/password_reset_state.dart';
import '../widgets/auth_text_field_widget.dart';
import '../widgets/create_account_title.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, AppStrings.resetPassword),
      body: ResetPasswordBody(
          formKey: _formKey,
          passwordController: passwordController,
          confirmPasswordController: confirmPasswordController),
    );
  }
}

class ResetPasswordBody extends StatelessWidget {
  const ResetPasswordBody({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.passwordController,
    required this.confirmPasswordController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PasswordResetCubit, PasswordResetState>(
      listener: (context, state) {
        state.maybeWhen(
          resetPasswordSuccess: (message) {
            showToast(message: message, state: ToastStates.SUCCESS);
            context.push(RouterNames.landing);
          },
          error: (message) {
            showToast(message: message, state: ToastStates.ERROR);
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        final bool isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.r),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 45.h),
                  const CreateAccountTitle(
                    title: AppStrings.resetPassword,
                    subTitle: AppStrings.newPasswordShouldHaveKeyAndNumber,
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    AppStrings.newPassword,
                    style: AppStyles.s16.copyWith(
                      color: AppColors.greyText,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  AuthTextFieldWidget(
                    hintText: AppStrings.enterPasswordHint,
                    controller: passwordController,
                    isPassword: true,
                    validator: Validator.validatePassword,
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    AppStrings.confirmPassword,
                    style: AppStyles.s16.copyWith(
                      color: AppColors.greyText,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  AuthTextFieldWidget(
                      hintText: AppStrings.hintConfirmPassword,
                      controller: confirmPasswordController,
                      isPassword: true,
                      validator: Validator.validatePassword),
                  SizedBox(height: 39.h),
                  isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : Align(
                          alignment: Alignment.center,
                        child: CustomButton(
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                context.read<PasswordResetCubit>().resetPassword(
                                      passwordController.text,
                                      confirmPasswordController.text,
                                    );
                              }
                            },
                            text: AppStrings.confirm,
                          ),
                      )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
