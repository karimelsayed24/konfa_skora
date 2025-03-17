
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/errors/error_model.dart';
import '../../../profile/data/model/change_password_response.dart';
import '../../data/model/address_response.dart';

part 'address_state.freezed.dart';

@freezed
class AddressState with _$AddressState {
  const factory AddressState.initial() = _Initial;
  const factory AddressState.loading() = _Loading;
  const factory AddressState.addressLoaded(AddressResponse response) = _AddressLoaded;
  const factory AddressState.addressStored(PublicResponse response) = _AddressStored;
  const factory AddressState.addressDeleted(PublicResponse response) = _AddressDeleted;
  const factory AddressState.error(ErrorModel error) = _Error;
}