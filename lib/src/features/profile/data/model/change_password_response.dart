import 'package:json_annotation/json_annotation.dart';

part 'change_password_response.g.dart';

@JsonSerializable()
class PublicResponse {
  final String key;
  final String msg;
  final List<dynamic> data;

  PublicResponse({
    required this.key,
    required this.msg,
    required this.data,
  });

  factory PublicResponse.fromJson(Map<String, dynamic> json) =>
      _$PublicResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PublicResponseToJson(this);
}