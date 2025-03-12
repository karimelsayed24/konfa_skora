import 'package:json_annotation/json_annotation.dart';

part 'question_response.g.dart';

@JsonSerializable()
class QuestionResponse {
  final String key;
  final String msg;
  final List<QuestionModel> data;

  QuestionResponse({
    required this.key,
    required this.msg,
    required this.data,
  });

  factory QuestionResponse.fromJson(Map<String, dynamic> json) => 
      _$QuestionResponseFromJson(json);
  
  Map<String, dynamic> toJson() => _$QuestionResponseToJson(this);
}

@JsonSerializable()
class QuestionModel {
  final int id;
  final String question;
  final String answer;

  QuestionModel({
    required this.id,
    required this.question,
    required this.answer,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) => 
      _$QuestionModelFromJson(json);
  
  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);
}