import 'package:json_annotation/json_annotation.dart';



part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
   @JsonKey(name: 'key')
  final String responseKey;
  final String msg;
  final UserData data;

  LoginResponse({
    required this.responseKey,
    required this.msg,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class UserData {
  @JsonKey(name: 'first_name')
  final String firstName;

  @JsonKey(name: 'last_name')
  final String lastName;

  final String email;

  @JsonKey(name: 'country_code')
  final String? countryCode;

  final String phone;

  @JsonKey(name: 'birth_date')
  final String birthDate;

  final String token;

  UserData({
    required this.firstName,
    required this.lastName,
    required this.email,
     this.countryCode,
    required this.phone,
    required this.birthDate,
    required this.token,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

