// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailsResponse _$ProductDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    ProductDetailsResponse(
      key: json['key'] as String,
      msg: json['msg'] as String,
      data: ProductDetails.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductDetailsResponseToJson(
        ProductDetailsResponse instance) =>
    <String, dynamic>{
      'key': instance.key,
      'msg': instance.msg,
      'data': instance.data,
    };

ProductDetails _$ProductDetailsFromJson(Map<String, dynamic> json) =>
    ProductDetails(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      avgRate: json['avg_rate'] as String,
      price: json['price'] as String,
      image: json['image'] as String,
      recipe: json['recipe'] as String,
      isFavorited: json['is_favorited'] as bool,
      additions: (json['additions'] as List<dynamic>)
          .map((e) => Addition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductDetailsToJson(ProductDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avg_rate': instance.avgRate,
      'price': instance.price,
      'image': instance.image,
      'recipe': instance.recipe,
      'is_favorited': instance.isFavorited,
      'additions': instance.additions,
    };

Addition _$AdditionFromJson(Map<String, dynamic> json) => Addition(
      name: json['name'] as String,
      price: json['price'] as String,
    );

Map<String, dynamic> _$AdditionToJson(Addition instance) => <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
    };
