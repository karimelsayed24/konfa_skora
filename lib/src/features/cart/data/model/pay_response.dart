import 'package:json_annotation/json_annotation.dart';

part 'pay_response.g.dart';

@JsonSerializable()
class PayResponse {
  final String key;
  final String msg;
  final PayData data;

  PayResponse({required this.key, required this.msg, required this.data});

  factory PayResponse.fromJson(Map<String, dynamic> json) => _$PayResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PayResponseToJson(this);
}

@JsonSerializable()
class PayData {
  @JsonKey(name: 'redirect_url')
  final String? redirectUrl;

  PayData({ this.redirectUrl});

  factory PayData.fromJson(Map<String, dynamic> json) => _$PayDataFromJson(json);
  Map<String, dynamic> toJson() => _$PayDataToJson(this);
}