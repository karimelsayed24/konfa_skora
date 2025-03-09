
import 'package:json_annotation/json_annotation.dart';

part 'user_profile_model.g.dart';
@JsonSerializable()
class ProfileResponse {
  final String key;
  final String msg;
  final UserProfileModel data;

  ProfileResponse({
    required this.key,
    required this.msg,
    required this.data,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) => _$ProfileResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);
}

@JsonSerializable()
class UserProfileModel {
  final String image;
  final String? lng;
  final String? lat;
  @JsonKey(name: 'map_desc')
  final String? mapDesc;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  final String email;
  @JsonKey(name: 'country_code')
  final String countryCode;
  final String phone;
  @JsonKey(name: 'birth_date')
  final String birthDate;

  UserProfileModel({
    required this.image,
    this.lng,
    this.lat,
    this.mapDesc,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.countryCode,
    required this.phone,
    required this.birthDate,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) => _$UserProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserProfileModelToJson(this);
}