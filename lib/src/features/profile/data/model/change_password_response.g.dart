// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublicResponse _$PublicResponseFromJson(Map<String, dynamic> json) =>
    PublicResponse(
      key: json['key'] as String,
      msg: json['msg'] as String,
      data: json['data'] as List<dynamic>,
    );

Map<String, dynamic> _$PublicResponseToJson(PublicResponse instance) =>
    <String, dynamic>{
      'key': instance.key,
      'msg': instance.msg,
      'data': instance.data,
    };
