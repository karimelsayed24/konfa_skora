import 'package:json_annotation/json_annotation.dart';

part 'address_response.g.dart';

@JsonSerializable()
class AddressResponse {
  final String key;
  final String msg;
  final List<AddressData> data;

  AddressResponse({required this.key, required this.msg, required this.data});

  factory AddressResponse.fromJson(Map<String, dynamic> json) => _$AddressResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AddressResponseToJson(this);
}

@JsonSerializable()
class AddressData {
  final int id;
  final String title;
  @JsonKey(name: 'map_desc')
  final String mapDesc;
  final String lng;
  final String lat;

  AddressData({
    required this.id,
    required this.title,
    required this.mapDesc,
    required this.lng,
    required this.lat,
  });

  factory AddressData.fromJson(Map<String, dynamic> json) => _$AddressDataFromJson(json);
  Map<String, dynamic> toJson() => _$AddressDataToJson(this);
}
