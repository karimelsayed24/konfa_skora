import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryResponse {
  final String key;
  final String msg;
  final List<CategoryModel> data;

  CategoryResponse({required this.key, required this.msg, required this.data});

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);
}

@JsonSerializable()
class CategoryModel {
  final int id;
  final String name;
  final String? image;
  final List<CategoryChild> children;

  CategoryModel({
    required this.id,
    required this.name,
    this.image,
    required this.children,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}

@JsonSerializable()
class CategoryChild {
  final int id;
  final String name;

  CategoryChild({required this.id, required this.name});

  factory CategoryChild.fromJson(Map<String, dynamic> json) =>
      _$CategoryChildFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryChildToJson(this);
}