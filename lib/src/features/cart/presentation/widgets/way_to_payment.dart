import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konaf_skora/core/utils/app_assets.dart';

import '../../../../../core/common/widgets/custom_btn.dart';
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
    return BlocListener<CheckOutCubit , CheckOutState>(
      listener: (context, state) {
       state.maybeWhen(
         orElse: (){},
         loading: (){
           ScaffoldMessenger.of(context).showSnackBar(
             const SnackBar(
               content: Text('جاري تنفيذ الطلب'),
               backgroundColor: Colors.green,
             ),
           );
         },
         success: (response){
          UrlLauncherMethods.launchInApp(response.data.redirectUrl);
          
         },
         error: (message){
         
         }
       );
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
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Column(
              children: [
                // Cash on delivery option
                ListTile(
                  trailing: const Text(
                    AppStrings.cashOnDelivery,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
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
                      Container(
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
                    ],
                  ),
                ),
                const Divider(height: 1, indent: 16, endIndent: 16),
                // VISA option
                ListTile(
                  trailing: const Text(
                    AppStrings.visa,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
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
                      Container(
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
                    ],
                  ),
                ),
                CustomButton(
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum PaymentMethod { cash, visa }
