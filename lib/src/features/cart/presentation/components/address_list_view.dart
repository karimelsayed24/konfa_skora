import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../location/data/model/address_response.dart';
import '../../../location/presentation/logic/address_cubit.dart';
import '../../../location/presentation/logic/address_state.dart';
import '../widgets/address_item.dart';

class AddressListView extends StatefulWidget {
  const AddressListView({super.key, required this.onAddressSelected, this.initialAddress});
  final Function(AddressData?) onAddressSelected;
  final AddressData? initialAddress;
  @override
  State<AddressListView> createState() => _AddressListViewState();
}

class _AddressListViewState extends State<AddressListView> {
  AddressData? _selectedAddress;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.deliveryAddress,
          style: AppStyles.s20.copyWith(
            color: AppColors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 12),
        BlocBuilder<AddressCubit, AddressState>(
          builder: (context, state) {
            return state.maybeWhen(
              initial: () => _buildAddressLoadingCard(),
              loading: () => _buildAddressLoadingCard(),
              addressLoaded: (addresses) {
                if (addresses.data.isEmpty) {
                  return const Text(
                    'لا توجد عناوين مسجلة',
                    style: TextStyle(color: Colors.grey),
                  );
                }
                if (_selectedAddress == null && addresses.data.isNotEmpty) {
                  _selectedAddress = addresses.data[0];
                  widget.onAddressSelected(_selectedAddress);
                }

                return _buildAddressCard(addresses.data);
              },
              error: (error) => _buildAddressErrorCard(error.toString()),
              orElse: () => _buildAddressLoadingCard(),
            );
          },
        ),
      ],
    );
  }

  Widget _buildAddressLoadingCard() {
    return const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFEF8A8A)),
    );
  }

  Widget _buildAddressErrorCard(String errorMessage) {
    return Container(
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
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Text(
          'حدث خطأ في تحميل العناوين: $errorMessage',
          style: const TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  Widget _buildAddressCard(List<AddressData> addresses) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: addresses.length,
      separatorBuilder: (context, index) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        final address = addresses[index];

        return InkWell(
          onTap: () {
            setState(() {
              _selectedAddress = address;
                            widget.onAddressSelected(_selectedAddress);

            });
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              border: Border.all(color: AppColors.borderGrey),
            ),
            padding: EdgeInsets.all(16.r),
            child: Row(
              children: [
                Radio<int>(
                  value: address.id,
                  groupValue: _selectedAddress?.id,
                  onChanged: (value) {
                    setState(() {
                      _selectedAddress = address;
                                    widget.onAddressSelected(_selectedAddress);

                    });
                  },
                  activeColor: const Color(0xFFEF8A8A),
                ),
                const SizedBox(width: 8),
                AddressItem(address: address),
              ],
            ),
          ),
        );
      },
      // ),
    );
  }
}
