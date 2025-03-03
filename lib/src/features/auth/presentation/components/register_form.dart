import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:konaf_skora/core/common/functions/validator.dart';

import '../../../../../core/common/widgets/custom_btn.dart';
import '../../../../../core/common/widgets/custom_text_form_field.dart';
import '../../../../../core/common/widgets/have_an_account.dart';
import '../../../../../core/functions/show_toast.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../data/model/user_request.dart';
import '../logic/register/register_cubit.dart';
import '../logic/register/register_state.dart';
import '../view/otp_verification_sheet.dart';
import '../widgets/auth_text_field_widget.dart';
import '../widgets/create_account_title.dart';
import '../widgets/first_and_last_name_row.dart';
import '../widgets/phone_and_date_row.dart';


class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController phoneController;
  late final TextEditingController dateController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    phoneController = TextEditingController();
    dateController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    dateController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        state.whenOrNull(
          error: (error) {
            showToast(message: error.message, state: ToastStates.ERROR);
          },
          success: (response) {
            showToast(message: response.msg, state:ToastStates.SUCCESS ,);
            context.pop(context); 
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) => OtpVerificationSheet(
                onSubmit: (otp) {
                  print('Submitted OTP: $otp');
                },
              ),
            );
          },
        );
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const CreateAccountTitle(
                  title: AppStrings.createNewAccount,
                  subTitle: AppStrings.personalData,
                ),
                SizedBox(height: 20.h),
                FirstAndLastNameRow(
                  firstNameController: firstNameController,
                  lastNameController: lastNameController,
                ),
                SizedBox(height: 20.h),
                PhoneAndDateRow(
                  phoneController: phoneController,
                  dateController: dateController,
                ),
                SizedBox(height: 20.h),
                AuthTextFieldWidget(
                  hintText: AppStrings.emailHint,
                  controller: emailController,
                  isPassword: false,
                  validator: Validator.validateEmail,
                ),
                SizedBox(height: 20.h),
                AuthTextFieldWidget(
                  hintText: AppStrings.enterPasswordHint,
                  controller: passwordController,
                  isPassword: true,
                  
                  validator: Validator.validatePassword,
                ),
                SizedBox(height: 20.h),
                AuthTextFieldWidget(
                  hintText: AppStrings.hintConfirmPassword,
                  controller: confirmPasswordController,
                    isPassword: true,
                  validator: Validator.validatePassword,
                ),
                SizedBox(height: 20.h),
                BlocBuilder<RegisterCubit, RegisterState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      loading: () => const CircularProgressIndicator(),
                      orElse: () => CustomButton(
                        text: AppStrings.next,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final request = UserRequest(
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              phone: phoneController.text,
                              birthDate: dateController.text,
                              email: emailController.text,
                              password: passwordController.text,
                            );
                            context.read<RegisterCubit>().register(request);
                          }
                        },
                      ),
                    );
                  },
                ),
                SizedBox(height: 12.h),
                HaveAnAccountWidget(
                  onTap: () {},
                  title1: AppStrings.haveAnAccount,
                  title2: AppStrings.signIn,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}