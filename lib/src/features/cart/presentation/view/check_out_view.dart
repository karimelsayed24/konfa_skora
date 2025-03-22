import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konaf_skora/src/features/cart/presentation/components/address_list_view.dart';

// Imports
import '../../../../../core/services/service_locator.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/custom_app_bar.dart';
import '../../../location/data/model/address_response.dart';
import '../../../location/presentation/logic/address_cubit.dart';
import '../../data/model/cart_response_model.dart';
import '../logic/checkout_cubit.dart';
import '../widgets/add_new_order.dart';
import '../widgets/order_details_in_check_out.dart';
import '../widgets/way_to_payment.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key, required this.cartData});
  final CartData cartData;

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  AddressData? _selectedAddress;

  @override
  void initState() {
    super.initState();
    context.read<AddressCubit>().getAllAddresses();
  }

  void _updateSelectedAddress(AddressData? address) {
     WidgetsBinding.instance.addPostFrameCallback((_) {
    setState(() {
      _selectedAddress = address;
    });
  });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CheckOutCubit>(),
      child: Scaffold(
          appBar: customAppBar(context, AppStrings.checkout),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 24),
                        OrderDetailsInCheckOut(
                          cartData: widget.cartData,
                        ),
                        const SizedBox(height: 24),
                        AddressListView(
                          onAddressSelected: _updateSelectedAddress,
                          initialAddress: _selectedAddress,
                        ),
                        const SizedBox(height: 6),
                        const AddNewAddress(),
                        const SizedBox(height: 24),
                        WayToPayment(
                          selectedAddress: _selectedAddress,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
