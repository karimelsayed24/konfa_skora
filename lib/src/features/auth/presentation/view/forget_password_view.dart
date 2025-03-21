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

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, AppStrings.forgetPassword),
      body: const ForgetPasswordBody(),
    );
  }
}

class ForgetPasswordBody extends StatefulWidget {
  const ForgetPasswordBody({
    super.key,
  });

  @override
  State<ForgetPasswordBody> createState() => _ForgetPasswordBodyState();
}

class _ForgetPasswordBodyState extends State<ForgetPasswordBody> {
  late final TextEditingController emailController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PasswordResetCubit, PasswordResetState>(
      listener: (context, state) {
        state.maybeWhen(
          loading: () {},
          forgetPasswordSuccess: (message) {
            showToast(message: message, state: ToastStates.SUCCESS);
            context.push(RouterNames.verifyOtpView);
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
                    subTitle: AppStrings.forgetPasswordMessage,
                  ),
                  SizedBox(height: 39.h),
                  Text(
                    AppStrings.email,
                    style: AppStyles.s16.copyWith(
                      color: AppColors.greyText,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  AuthTextFieldWidget(
                    hintText: AppStrings.emailHint,
                    controller: emailController,
                    isPassword: false,
                    validator: Validator.validateEmail,
                  ),
                  SizedBox(height: 39.h),
                  isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : Align(
                          alignment: Alignment.center,
                        child: CustomButton(
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                context
                                    .read<PasswordResetCubit>()
                                    .forgetPassword(emailController.text.trim());
                              }
                            },
                            text: AppStrings.send,
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
