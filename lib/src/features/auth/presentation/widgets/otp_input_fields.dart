
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:konaf_skora/core/common/widgets/custom_btn.dart';
import 'package:konaf_skora/core/utils/app_strings.dart';

import '../../../../../core/functions/show_toast.dart';
import '../logic/verification/verification_cubit.dart';
import '../logic/verification/verification_state.dart';

class OtpInputFields extends StatefulWidget {
  final String phone;
  
  const OtpInputFields({
    super.key,
    required this.phone,
  });
  
  @override
  State<OtpInputFields> createState() => _OtpInputFieldsState();
}

class _OtpInputFieldsState extends State<OtpInputFields> {
  final List<TextEditingController> controllers = List.generate(
    6,
    (index) => TextEditingController(),
  );
  
  final List<FocusNode> focusNodes = List.generate(
    6,
    (index) => FocusNode(),
  );
  
  String get otp => controllers.map((c) => c.text).join();
  
  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocListener<VerificationCubit, VerificationState>(
      listener: (context, state) {
        state.maybeWhen(
          verificationSuccess: (response) {
            showToast(message: response.msg, state: ToastStates.SUCCESS);
          // navigate
          },
          verificationError: (error) {
            showToast(message:  error.message,  state:ToastStates.ERROR);
        
          },
          orElse: () {},
        );
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              6,
              (index) => SizedBox(
                width: 45,
                height: 45,
                child: TextField(
                  controller: controllers[index],
                  focusNode: focusNodes[index],
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    if (value.isNotEmpty && index < 5) {
                      focusNodes[index + 1].requestFocus();
                    }
                    if (index == 5 && otp.length == 6) {
                      // Auto-submit when all fields are filled
                      _verifyOtp();
                    }
                  },
                ),
              ),
            ),
          ),
          
          SizedBox(height: 50.h),
          BlocBuilder<VerificationCubit, VerificationState>(
            builder: (context, state) {
              final isLoading = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              
              return isLoading ? CircularProgressIndicator() : CustomButton(
                text: AppStrings.verifyAndFollow,
                onPressed: _verifyOtp,
              );
            },
          ),
        ],
      ),
    );
  }
  
  void _verifyOtp() {
    if (otp.length == 6) {
      context.read<VerificationCubit>().verifyEmail(widget.phone, otp);
    }
  }
}