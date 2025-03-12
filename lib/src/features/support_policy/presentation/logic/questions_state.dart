import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/question_response.dart';

part 'questions_state.freezed.dart';

@freezed
class QuestionsState with _$QuestionsState {
  const factory QuestionsState.initial() = _Initial;
  const factory QuestionsState.loading() = _Loading;
  const factory QuestionsState.loaded(QuestionResponse questions) = _Loaded;
  const factory QuestionsState.error(String message) = _Error;
}