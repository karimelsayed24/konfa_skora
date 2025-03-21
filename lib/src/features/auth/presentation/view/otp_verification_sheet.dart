import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:konaf_skora/core/routes/router_names.dart';
import 'package:konaf_skora/core/services/service_locator.dart';
import '../logic/verification/verification_cubit.dart';
import '../logic/verification/verification_state.dart';
import '../widgets/otp_header.dart';
import '../widgets/otp_input_fields.dart';
import '../widgets/otp_timer.dart';

class OtpVerificationSheet extends StatelessWidget {
  final String phone;
  final VoidCallback? onClose;

  const OtpVerificationSheet({
    super.key,
    this.onClose,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<VerificationCubit>(),
      child: BlocListener<VerificationCubit, VerificationState>(
        listener: (context, state) {
         state.maybeWhen(
            orElse: () {},
            verificationSuccess: (phone) {
              context.pushReplacement(RouterNames.locationSelectorView);
            },
          );
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const OtpHeader(),
                SizedBox(height: 23.h),
                OtpInputFields(phone: phone),
                SizedBox(height: 10.h),
                OtpTimer(phone: phone),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
