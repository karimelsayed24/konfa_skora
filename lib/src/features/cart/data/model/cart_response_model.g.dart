// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartResponse _$CartResponseFromJson(Map<String, dynamic> json) => CartResponse(
      key: json['key'] as String,
      msg: json['msg'] as String,
      data: CartData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartResponseToJson(CartResponse instance) =>
    <String, dynamic>{
      'key': instance.key,
      'msg': instance.msg,
      'data': instance.data,
    };

CartData _$CartDataFromJson(Map<String, dynamic> json) => CartData(
      cartItems: (json['cart_items'] as List<dynamic>)
          .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      cartPrices:
          CartPrices.fromJson(json['cart_prices'] as Map<String, dynamic>),
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$CartDataToJson(CartData instance) => <String, dynamic>{
      'cart_items': instance.cartItems,
      'cart_prices': instance.cartPrices,
      'currency': instance.currency,
    };

CartItem _$CartItemFromJson(Map<String, dynamic> json) => CartItem(
      id: (json['id'] as num).toInt(),
      productName: json['product_name'] as String,
      productImage: json['product_image'] as String,
      quantity: (json['quantity'] as num).toInt(),
      isFree: json['is_free'] as bool,
      price: (json['price'] as num).toInt(),
    );

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
      'id': instance.id,
      'product_name': instance.productName,
      'product_image': instance.productImage,
      'quantity': instance.quantity,
      'is_free': instance.isFree,
      'price': instance.price,
    };

CartPrices _$CartPricesFromJson(Map<String, dynamic> json) => CartPrices(
      price: (json['price'] as num).toInt(),
      deliveryPrice: (json['delivery_price'] as num).toInt(),
      totalPrice: (json['total_price'] as num).toInt(),
    );

Map<String, dynamic> _$CartPricesToJson(CartPrices instance) =>
    <String, dynamic>{
      'price': instance.price,
      'delivery_price': instance.deliveryPrice,
      'total_price': instance.totalPrice,
    };
