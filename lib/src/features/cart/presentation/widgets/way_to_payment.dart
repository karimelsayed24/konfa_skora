import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:konaf_skora/core/utils/app_assets.dart';

import '../../../../../core/common/widgets/custom_btn.dart';
import '../../../../../core/routes/router_names.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/url_launcher_methods.dart';
import '../../../location/data/model/address_response.dart';
import '../logic/checkout_cubit.dart';
import '../logic/checkout_state.dart';

class WayToPayment extends StatefulWidget {
  const WayToPayment({super.key, this.selectedAddress});
  final AddressData? selectedAddress;
  @override
  State<WayToPayment> createState() => _WayToPaymentState();
}

class _WayToPaymentState extends State<WayToPayment> {
  String _paymentMethod = 'cash';

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckOutCubit, CheckOutState>(
      listener: (context, state) {
        state.maybeWhen(
            orElse: () {},
            loading: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('جاري تنفيذ الطلب'),
                  backgroundColor: Colors.blueAccent,
                ),
              );
            },
            success: (response) {
              if(response.data.redirectUrl!=null){
                UrlLauncherMethods.launchInApp(response.data.redirectUrl!);
              
              }else{
                    context.push(RouterNames.successPage,);
              }
            },
            error: (message) {});
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.paymentMethod,
            style: AppStyles.s20.copyWith(
              color: AppColors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              border: Border.all(color: AppColors.borderGrey),
            ),
            padding: EdgeInsets.all(16.r),
            child: Column(
              children: [
                ListTile(
                  trailing: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Image.asset(
                      AppAssets.cash,
                      width: 24,
                      height: 24,
                      errorBuilder: (context, error, stackTrace) => Icon(
                        Icons.money,
                        size: 24,
                        color: Colors.green[700],
                      ),
                    ),
                  ),
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Radio<String>(
                        value: PaymentMethod.cash.toString(),
                        groupValue: _paymentMethod,
                        onChanged: (value) {
                          setState(() {
                            _paymentMethod = value!;
                          });
                        },
                        activeColor: const Color(0xFFEF8A8A),
                      ),
                       Text(
                        AppStrings.cashOnDelivery,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                ),
                const Divider(height: 1, indent: 16, endIndent: 16),
                ListTile(
                  trailing: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Image.asset(
                      AppAssets.visa,
                      width: 40,
                      height: 24,
                      errorBuilder: (context, error, stackTrace) => Text(
                        'VISA',
                        style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Radio<String>(
                        value: PaymentMethod.visa.toString(),
                        groupValue: _paymentMethod,
                        onChanged: (value) {
                          setState(() {
                            _paymentMethod = value!;
                          });
                        },
                        activeColor: const Color(0xFFEF8A8A),
                      ),
                       Text(
                        AppStrings.visa,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              
              ],
            ),
          ),
                    const SizedBox(height: 12),

            Align(
              alignment: Alignment.center,
              child: CustomButton(
                    onPressed: () {
                      if (widget.selectedAddress == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('الرجاء اختيار عنوان للتوصيل'),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }
                      context.read<CheckOutCubit>().checkOut(
                            addressId: widget.selectedAddress!.id,
                            payType:
                                _paymentMethod == PaymentMethod.cash.toString()
                                    ? 0
                                    : 1,
                          );
                      print(
                          'تم الطلب: ${widget.selectedAddress!.id} العنوان: ${widget.selectedAddress?.title}, طريقة الدفع: $_paymentMethod');
                    },
                    text: AppStrings.goToPay,
                  ),
            ),
                                 SizedBox(height: 16.h),

        ],
      ),
    );
  }
}

enum PaymentMethod { cash, visa }
