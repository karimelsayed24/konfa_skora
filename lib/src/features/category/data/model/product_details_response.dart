import 'package:json_annotation/json_annotation.dart';

part 'product_details_response.g.dart';

@JsonSerializable()
class ProductDetailsResponse {
  final String key;
  final String msg;
  final ProductDetails data;

  ProductDetailsResponse({
    required this.key,
    required this.msg,
    required this.data,
  });

  factory ProductDetailsResponse.fromJson(Map<String, dynamic> json) => 
      _$ProductDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailsResponseToJson(this);
}

@JsonSerializable()
class ProductDetails {
  final int id;
  final String name;
  
  @JsonKey(name: 'avg_rate')
  final String avgRate;
  
  final String price;
  final String image;
  final String recipe;
  
  @JsonKey(name: 'is_favorited')
  final bool isFavorited;

  @JsonKey(name: 'can_apply_prize')
  final int canApplyPrize;
  
  final List<Addition> additions;

  ProductDetails({
    required this.id,
    required this.name,
    required this.avgRate,
    required this.price,
    required this.image,
    required this.recipe,
    required this.isFavorited,
    required this.canApplyPrize,
    required this.additions,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) => 
      _$ProductDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailsToJson(this);
}

@JsonSerializable()
class Addition {
  final int id;
  final String name;
  final String price;

  Addition({
    required this.id,
    required this.name,
    required this.price,
  });

  factory Addition.fromJson(Map<String, dynamic> json) => 
      _$AdditionFromJson(json);

  Map<String, dynamic> toJson() => _$AdditionToJson(this);
}