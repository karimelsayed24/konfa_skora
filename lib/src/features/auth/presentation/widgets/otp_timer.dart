import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/functions/show_toast.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../logic/verification/verification_cubit.dart';
import '../logic/verification/verification_state.dart';

class OtpTimer extends StatefulWidget {
  final String phone;
  
  const OtpTimer({super.key, required this.phone});

  @override
  State<OtpTimer> createState() => _OtpTimerState();
}

class _OtpTimerState extends State<OtpTimer> {
  Timer? _timer;
  int _secondsRemaining = 60; // 1 minute
  bool _isTimerRunning = true;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _isTimerRunning = true;
    _secondsRemaining = 60;
    
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _isTimerRunning = false;
          _timer?.cancel();
        }
      });
    });
  }

  String get _timerText {
    int minutes = _secondsRemaining ~/ 60;
    int seconds = _secondsRemaining % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isTimerRunning
        ? Text(
            _timerText,
            style: const TextStyle(
              color: AppColors.primaryColor,
              fontSize: 16,
            ),
          )
        : BlocConsumer<VerificationCubit, VerificationState>(
            listener: (context, state) {
              state.maybeWhen(
                resendCodeSuccess: (message) {
                             showToast(message: message, state: ToastStates.SUCCESS);

                  _startTimer();
                },
                resendCodeError: (error) {
                  showToast(message: error.message, state: ToastStates.ERROR);
                },
                orElse: () {},
              );
            },
            builder: (context, state) {
              final isLoading = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              
              return isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.primaryColor,
                    ),
                  )
                : TextButton(
                    onPressed: () {
                      context.read<VerificationCubit>().resendCode(widget.phone);
                    },
                    child:  Text(
                      AppStrings.resendCode,
                      style: const TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
            },
          );
  }
}