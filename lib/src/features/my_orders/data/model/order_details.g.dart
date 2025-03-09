// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyOrderDetailsResponse _$MyOrderDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    MyOrderDetailsResponse(
      key: json['key'] as String,
      msg: json['msg'] as String,
      data: OrderDetailsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyOrderDetailsResponseToJson(
        MyOrderDetailsResponse instance) =>
    <String, dynamic>{
      'key': instance.key,
      'msg': instance.msg,
      'data': instance.data,
    };

OrderDetailsData _$OrderDetailsDataFromJson(Map<String, dynamic> json) =>
    OrderDetailsData(
      id: (json['id'] as num).toInt(),
      order_num: json['order_num'] as String,
      items_count: (json['items_count'] as num).toInt(),
      total_price: json['total_price'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      created_at: json['created_at'] as String,
    );

Map<String, dynamic> _$OrderDetailsDataToJson(OrderDetailsData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_num': instance.order_num,
      'items_count': instance.items_count,
      'total_price': instance.total_price,
      'items': instance.items,
      'created_at': instance.created_at,
    };

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => OrderItem(
      product_name: json['product_name'] as String,
      product_image: json['product_image'] as String,
      item_additions: (json['item_additions'] as List<dynamic>)
          .map((e) => ItemAddition.fromJson(e as Map<String, dynamic>))
          .toList(),
      price: json['price'] as String,
    );

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
      'product_name': instance.product_name,
      'product_image': instance.product_image,
      'item_additions': instance.item_additions,
      'price': instance.price,
    };

ItemAddition _$ItemAdditionFromJson(Map<String, dynamic> json) => ItemAddition(
      name: json['name'] as String,
    );

Map<String, dynamic> _$ItemAdditionToJson(ItemAddition instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
