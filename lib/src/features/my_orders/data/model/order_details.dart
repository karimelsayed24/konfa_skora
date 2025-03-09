import 'package:json_annotation/json_annotation.dart';

part 'order_details.g.dart';

@JsonSerializable()
class MyOrderDetailsResponse {
  final String key;
  final String msg;
  final OrderDetailsData data;

  MyOrderDetailsResponse({
    required this.key,
    required this.msg,
    required this.data,
  });

  factory MyOrderDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$MyOrderDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MyOrderDetailsResponseToJson(this);
}

@JsonSerializable()
class OrderDetailsData {
  final int id;
  final String order_num;
  final int items_count;
  final String total_price;
  final List<OrderItem> items;
  final String created_at;

  OrderDetailsData({
    required this.id,
    required this.order_num,
    required this.items_count,
    required this.total_price,
    required this.items,
    required this.created_at,
  });

  factory OrderDetailsData.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsDataFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailsDataToJson(this);
}

@JsonSerializable()
class OrderItem {
  final String product_name;
  final String product_image;
  final List<ItemAddition> item_additions;
  final String price;

  OrderItem({
    required this.product_name,
    required this.product_image,
    required this.item_additions,
    required this.price,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemToJson(this);
}

@JsonSerializable()
class ItemAddition {
  final String name;

  ItemAddition({
    required this.name,
  });

  factory ItemAddition.fromJson(Map<String, dynamic> json) =>
      _$ItemAdditionFromJson(json);

  Map<String, dynamic> toJson() => _$ItemAdditionToJson(this);
}

