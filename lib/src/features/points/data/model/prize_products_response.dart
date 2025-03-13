import 'package:json_annotation/json_annotation.dart';

part 'prize_products_response.g.dart';

@JsonSerializable()
class PrizeProductsResponse {
  final String key;
  final String msg;
  final List<PrizeProduct> data;

  PrizeProductsResponse({
    required this.key,
    required this.msg,
    required this.data,
  });

  factory PrizeProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$PrizeProductsResponseFromJson(json);
  
  Map<String, dynamic> toJson() => _$PrizeProductsResponseToJson(this);
}

@JsonSerializable()
class PrizeProduct {
  final int id;
  final String image;
  
  @JsonKey(name: 'needed_points')
  final int neededPoints;
  
  @JsonKey(name: 'current_points')
  final int currentPoints;
  
  final int percentage;
  
  @JsonKey(name: 'can_add_product')
  final bool canAddProduct;

  PrizeProduct({
    required this.id,
    required this.image,
    required this.neededPoints,
    required this.currentPoints,
    required this.percentage,
    required this.canAddProduct,
  });

  factory PrizeProduct.fromJson(Map<String, dynamic> json) =>
      _$PrizeProductFromJson(json);
  
  Map<String, dynamic> toJson() => _$PrizeProductToJson(this);
}



@JsonSerializable()
class ExtraPointsOptionsResponse {
  final String key;
  final String msg;
  final List<ExtraPointsOption> data;

  ExtraPointsOptionsResponse({
    required this.key,
    required this.msg,
    required this.data,
  });

  factory ExtraPointsOptionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ExtraPointsOptionsResponseFromJson(json);
  
  Map<String, dynamic> toJson() => _$ExtraPointsOptionsResponseToJson(this);
}

@JsonSerializable()
class ExtraPointsOption {
  final String key;
  final String value;

  ExtraPointsOption({
    required this.key,
    required this.value,
  });

  factory ExtraPointsOption.fromJson(Map<String, dynamic> json) =>
      _$ExtraPointsOptionFromJson(json);
  
  Map<String, dynamic> toJson() => _$ExtraPointsOptionToJson(this);
  
  String getTitle(key) {
    switch (key) {
      case 'delivery_price':
        return 'سعر التوصيل';
      case 'points_per_sar':
        return 'نقاط لكل ريال';
      case 'points_per_friend_invitation':
        return 'دعوة الأصدقاء';
      case 'points_per_app_rating':
        return 'تقييم التطبيق';
      default:
        return 'مكافأة';
    }
  }
  
  String getDescription(key) {
    switch (key) {
      case 'delivery_price':
        return 'سعر التوصيل لجميع الطلبات';
      case 'points_per_sar':
        return 'احصل على $value نقاط لكل ريال تنفقه';
      case 'points_per_friend_invitation':
        return 'تمنح لك $value نقاط إضافية لكل صديق تدعوه للتطبيق';
      case 'points_per_app_rating':
        return 'قم بتقييم التطبيق الآن وتحصل على $value نقطة إضافية';
      default:
        return 'احصل على $value نقاط إضافية';
    }
  }
}

@JsonSerializable()
class UserPointsResponse {
  final String key;
  final String msg;
  final UserPoints data;

  UserPointsResponse({
    required this.key,
    required this.msg,
    required this.data,
  });

  factory UserPointsResponse.fromJson(Map<String, dynamic> json) =>
      _$UserPointsResponseFromJson(json);
  
  Map<String, dynamic> toJson() => _$UserPointsResponseToJson(this);
}

@JsonSerializable()
class UserPoints {
  final int points;

  UserPoints({
    required this.points,
  });

  factory UserPoints.fromJson(Map<String, dynamic> json) =>
      _$UserPointsFromJson(json);
  
  Map<String, dynamic> toJson() => _$UserPointsToJson(this);
}