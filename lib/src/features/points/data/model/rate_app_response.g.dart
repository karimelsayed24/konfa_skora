// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_app_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RateAppResponse _$RateAppResponseFromJson(Map<String, dynamic> json) =>
    RateAppResponse(
      key: json['key'] as String,
      msg: json['msg'] as String,
      data: json['data'] as List<dynamic>,
    );

Map<String, dynamic> _$RateAppResponseToJson(RateAppResponse instance) =>
    <String, dynamic>{
      'key': instance.key,
      'msg': instance.msg,
      'data': instance.data,
    };
