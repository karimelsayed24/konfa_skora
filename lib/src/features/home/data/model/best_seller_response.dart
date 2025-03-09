// best_seller_response.dart
import 'package:json_annotation/json_annotation.dart';

part 'best_seller_response.g.dart';

@JsonSerializable()
class BestSellerResponse {
  final String key;
  final String msg;
  final List<BestSellerItem> data;

  BestSellerResponse({
    required this.key,
    required this.msg,
    required this.data,
  });

  factory BestSellerResponse.fromJson(Map<String, dynamic> json) => 
      _$BestSellerResponseFromJson(json);
  
  Map<String, dynamic> toJson() => _$BestSellerResponseToJson(this);
}

@JsonSerializable()
class BestSellerItem {
  final int id;
  final String name;
  final String description;
  final String image;
  
  @JsonKey(name: 'avg_rate')
  final String avgRate;
  
  final String price;
  
  @JsonKey(name: 'is_favorited')
  final bool isFavorite;

  BestSellerItem({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.avgRate,
    required this.price,
    required this.isFavorite,
  });

  factory BestSellerItem.fromJson(Map<String, dynamic> json) => 
      _$BestSellerItemFromJson(json);
  
  Map<String, dynamic> toJson() => _$BestSellerItemToJson(this);
}