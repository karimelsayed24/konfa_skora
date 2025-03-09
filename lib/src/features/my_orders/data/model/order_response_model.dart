import 'package:json_annotation/json_annotation.dart';

part 'order_response_model.g.dart';

@JsonSerializable()
class MyOrdersResponse {
  final String key;
  final String msg;
  final List<OrderData> data;

  MyOrdersResponse({
    required this.key,
    required this.msg,
    required this.data,
  });

  factory MyOrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$MyOrdersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MyOrdersResponseToJson(this);
}

@JsonSerializable()
class OrderData {
  final int id;
  @JsonKey(name: 'order_num')
  final String orderNum;
  @JsonKey(name: 'status_num')
  final int statusNum;
  @JsonKey(name: 'status_text')
  final String statusText;
  @JsonKey(name: 'total_price')
  final String totalPrice;
  final List<OrderItem> items;
  @JsonKey(name: 'items_count')
  final int itemsCount;
  @JsonKey(name: 'created_at')
  final String createdAt;

  bool get isCompleted => statusNum == 1; // Assuming 1 means completed

  OrderData({
    required this.id,
    required this.orderNum,
    required this.statusNum,
    required this.statusText,
    required this.totalPrice,
    required this.items,
    required this.itemsCount,
    required this.createdAt,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) =>
      _$OrderDataFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDataToJson(this);
}

@JsonSerializable()
class OrderItem {
  @JsonKey(name: 'product_name')
  final String productName;

  OrderItem({required this.productName});

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemToJson(this);
}