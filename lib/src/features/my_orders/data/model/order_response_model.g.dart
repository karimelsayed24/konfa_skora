// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyOrdersResponse _$MyOrdersResponseFromJson(Map<String, dynamic> json) =>
    MyOrdersResponse(
      key: json['key'] as String,
      msg: json['msg'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => OrderData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MyOrdersResponseToJson(MyOrdersResponse instance) =>
    <String, dynamic>{
      'key': instance.key,
      'msg': instance.msg,
      'data': instance.data,
    };

OrderData _$OrderDataFromJson(Map<String, dynamic> json) => OrderData(
      id: (json['id'] as num).toInt(),
      orderNum: json['order_num'] as String,
      statusNum: (json['status_num'] as num).toInt(),
      statusText: json['status_text'] as String,
      totalPrice: json['total_price'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      itemsCount: (json['items_count'] as num).toInt(),
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$OrderDataToJson(OrderData instance) => <String, dynamic>{
      'id': instance.id,
      'order_num': instance.orderNum,
      'status_num': instance.statusNum,
      'status_text': instance.statusText,
      'total_price': instance.totalPrice,
      'items': instance.items,
      'items_count': instance.itemsCount,
      'created_at': instance.createdAt,
    };

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => OrderItem(
      productName: json['product_name'] as String,
    );

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
      'product_name': instance.productName,
    };
