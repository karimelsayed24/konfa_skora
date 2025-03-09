// daily_order_response.dart
import 'package:json_annotation/json_annotation.dart';

part 'daily_order_response.g.dart';

@JsonSerializable()
class DailyOrderResponse {
  final String key;
  final String msg;
  final List<ProductItem> data;

  DailyOrderResponse({
    required this.key,
    required this.msg,
    required this.data,
  });

  factory DailyOrderResponse.fromJson(Map<String, dynamic> json) => 
      _$DailyOrderResponseFromJson(json);
  
  Map<String, dynamic> toJson() => _$DailyOrderResponseToJson(this);
}

@JsonSerializable()
class ProductItem {
  final int id;
  final String name;
  final String price;
  
  @JsonKey(name: 'avg_rate')
  final String avgRate;
  
  final String description;
  final String image;
  final int discount;

  ProductItem({
    required this.id,
    required this.name,
    required this.price,
    required this.avgRate,
    required this.description,
    required this.image,
    required this.discount,
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) => 
      _$ProductItemFromJson(json);
  
  Map<String, dynamic> toJson() => _$ProductItemToJson(this);
}