// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prize_products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrizeProductsResponse _$PrizeProductsResponseFromJson(
        Map<String, dynamic> json) =>
    PrizeProductsResponse(
      key: json['key'] as String,
      msg: json['msg'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => PrizeProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PrizeProductsResponseToJson(
        PrizeProductsResponse instance) =>
    <String, dynamic>{
      'key': instance.key,
      'msg': instance.msg,
      'data': instance.data,
    };

PrizeProduct _$PrizeProductFromJson(Map<String, dynamic> json) => PrizeProduct(
      id: (json['id'] as num).toInt(),
      image: json['image'] as String,
      neededPoints: (json['needed_points'] as num).toInt(),
      currentPoints: (json['current_points'] as num).toInt(),
      percentage: (json['percentage'] as num).toInt(),
      canAddProduct: json['can_add_product'] as bool,
    );

Map<String, dynamic> _$PrizeProductToJson(PrizeProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'needed_points': instance.neededPoints,
      'current_points': instance.currentPoints,
      'percentage': instance.percentage,
      'can_add_product': instance.canAddProduct,
    };

ExtraPointsOptionsResponse _$ExtraPointsOptionsResponseFromJson(
        Map<String, dynamic> json) =>
    ExtraPointsOptionsResponse(
      key: json['key'] as String,
      msg: json['msg'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => ExtraPointsOption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExtraPointsOptionsResponseToJson(
        ExtraPointsOptionsResponse instance) =>
    <String, dynamic>{
      'key': instance.key,
      'msg': instance.msg,
      'data': instance.data,
    };

ExtraPointsOption _$ExtraPointsOptionFromJson(Map<String, dynamic> json) =>
    ExtraPointsOption(
      key: json['key'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$ExtraPointsOptionToJson(ExtraPointsOption instance) =>
    <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
    };

UserPointsResponse _$UserPointsResponseFromJson(Map<String, dynamic> json) =>
    UserPointsResponse(
      key: json['key'] as String,
      msg: json['msg'] as String,
      data: UserPoints.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserPointsResponseToJson(UserPointsResponse instance) =>
    <String, dynamic>{
      'key': instance.key,
      'msg': instance.msg,
      'data': instance.data,
    };

UserPoints _$UserPointsFromJson(Map<String, dynamic> json) => UserPoints(
      points: (json['points'] as num).toInt(),
    );

Map<String, dynamic> _$UserPointsToJson(UserPoints instance) =>
    <String, dynamic>{
      'points': instance.points,
    };
