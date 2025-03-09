import 'package:json_annotation/json_annotation.dart';

part 'banner_response.g.dart';

@JsonSerializable()
class BannerResponse {
  final String key;
  final String msg;
  final List<BannerData> data;

  BannerResponse({
    required this.key,
    required this.msg,
    required this.data,
  });

  factory BannerResponse.fromJson(Map<String, dynamic> json) => 
      _$BannerResponseFromJson(json);
  
  Map<String, dynamic> toJson() => _$BannerResponseToJson(this);
}

@JsonSerializable()
class BannerData {
  final int id;
  final String image;

  BannerData({
    required this.id,
    required this.image,
  });

  // Connect the generated methods to this class
  factory BannerData.fromJson(Map<String, dynamic> json) => 
      _$BannerDataFromJson(json);
  
  Map<String, dynamic> toJson() => _$BannerDataToJson(this);
}