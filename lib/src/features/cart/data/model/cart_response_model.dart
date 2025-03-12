import 'package:json_annotation/json_annotation.dart';

part 'cart_response_model.g.dart';

@JsonSerializable()
class CartResponse {
  final String key;
  final String msg;
  final CartData data;

  CartResponse({
    required this.key,
    required this.msg,
    required this.data,
  });

  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CartResponseToJson(this);
}

@JsonSerializable()
class CartData {
  @JsonKey(name: 'cart_items')
  final List<CartItem> cartItems;
  
  @JsonKey(name: 'cart_prices')
  final CartPrices cartPrices;
  
  final String currency;

  CartData({
    required this.cartItems,
    required this.cartPrices,
    required this.currency,
  });

  factory CartData.fromJson(Map<String, dynamic> json) =>
      _$CartDataFromJson(json);

  Map<String, dynamic> toJson() => _$CartDataToJson(this);
}

@JsonSerializable()
class CartItem {
  final int id;
  
  @JsonKey(name: 'product_name')
  final String productName;
  
  @JsonKey(name: 'product_image')
  final String productImage;
  
  final int quantity;
  
  @JsonKey(name: 'is_free')
  final bool isFree;
  
  final int price;

  CartItem({
    required this.id,
    required this.productName,
    required this.productImage,
    required this.quantity,
    required this.isFree,
    required this.price,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemToJson(this);
}

@JsonSerializable()
class CartPrices {
  final int price;
  
  @JsonKey(name: 'delivery_price')
  final int deliveryPrice;
  
  @JsonKey(name: 'total_price')
  final int totalPrice;

  CartPrices({
    required this.price,
    required this.deliveryPrice,
    required this.totalPrice,
  });

  factory CartPrices.fromJson(Map<String, dynamic> json) =>
      _$CartPricesFromJson(json);

  Map<String, dynamic> toJson() => _$CartPricesToJson(this);
}