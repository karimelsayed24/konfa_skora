import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/address_use_case.dart';
import 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  final GetAllAddressUseCase getAllAddressUseCase;
  final StoreAddressUseCase storeAddressUseCase;
  final DeleteAddressUseCase deleteAddressUseCase;

  AddressCubit({
    required this.getAllAddressUseCase,
    required this.storeAddressUseCase,
    required this.deleteAddressUseCase,
  }) : super(const AddressState.initial());

  Future<void> getAllAddresses() async {
    emit(const AddressState.loading());
    final  result = await getAllAddressUseCase.call();
    result.fold(
      (error) => emit(AddressState.error(error)),
      (response) => emit(AddressState.addressLoaded(response)),
    );
  }

  Future<void> storeAddress({
    required String title,
    required String mapDesc,
    required double lat,
    required double lng,
  }) async {
    emit(const AddressState.loading());
    final  result = await storeAddressUseCase.call(
      title: title,
      mapDesc: mapDesc,
      lat: lat,
      lng: lng,
    );
    result.fold(
      (error) => emit(AddressState.error(error)),
      (response) => emit(AddressState.addressStored(response)),
    );
  }

  Future<void> deleteAddress(int id) async {
    emit(const AddressState.loading());
    final  result = await deleteAddressUseCase.call(id);
    result.fold(
      (error) => emit(AddressState.error(error)),
      (response) => emit(AddressState.addressDeleted(response)),
    );
  }
}