

import 'package:json_annotation/json_annotation.dart';

part 'rate_app_response.g.dart';

@JsonSerializable()

class RateAppResponse {
  final String key;
  final String msg;
  final List<dynamic> data;

  RateAppResponse({
    required this.key,
    required this.msg,
    required this.data,
  });
   factory RateAppResponse.fromJson(Map<String, dynamic> json) =>
      _$RateAppResponseFromJson(json);
  
  Map<String, dynamic> toJson() => _$RateAppResponseToJson(this);

}