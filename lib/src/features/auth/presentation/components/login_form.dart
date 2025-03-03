import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:konaf_skora/core/common/functions/validator.dart';
import 'package:konaf_skora/core/routes/router_names.dart';

import '../../../../../core/common/widgets/custom_btn.dart';
import '../../../../../core/common/widgets/have_an_account.dart';
import '../../../../../core/functions/show_toast.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import '../logic/login/login_cubit.dart';
import '../logic/login/login_state.dart';
import '../widgets/auth_text_field_widget.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _phoneController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (response) {
            showToast(message: response.msg, state: ToastStates.SUCCESS);
            if (response.responseKey=='ActivationNeeded') {
            // context.push(RouterNames.otpVerification);
            } else {
              //context.push(RouterNames.home);
            }
          },
          error: (error) {
            showToast(message: error.message, state: ToastStates.ERROR);
          },
        );
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            AuthTextFieldWidget(
              hintText: AppStrings.phoneHint,
              controller: _phoneController,
              isPassword: false,
              validator: Validator.validatePhone,
            ),
            SizedBox(height: 30.h),
            AuthTextFieldWidget(
              hintText: AppStrings.hintPassword,
              controller: _passwordController,
              isPassword: true,
              validator: Validator.validatePassword,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  //  context.push(RouterNames.forgotPassword);
                },
                child: Text(
                  AppStrings.forgetPassword,
                  style: AppStyles.s10.copyWith(
                    color: AppColors.grey,
                  ),
                ),
              ),
            ),
            BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () => const CircularProgressIndicator(),
                  orElse: () => CustomButton(
                    text: AppStrings.signIn,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<LoginCubit>().login(
                              _phoneController.text,
                              _passwordController.text,
                            );
                      }
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 22.h),
            HaveAnAccountWidget(
              onTap: () {
                context.push(RouterNames.register);
              },
              title1: AppStrings.dontHaveAnAccount,
              title2: AppStrings.createAccount,
            ),
            SizedBox(height: 22.h),
          ],
        ),
      ),
    );
  }
}
