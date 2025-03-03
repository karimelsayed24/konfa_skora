import 'package:json_annotation/json_annotation.dart';

part 'user_request.g.dart';


  
@JsonSerializable()
class UserRequest {
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  final String email;
  final String password;
  final String phone;
  @JsonKey(name: 'birth_date')
  final String birthDate;
 

  UserRequest({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phone,
    required this.birthDate,
    
  });

  factory UserRequest.fromJson(Map<String, dynamic> json) =>
      _$UserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserRequestToJson(this);
}

