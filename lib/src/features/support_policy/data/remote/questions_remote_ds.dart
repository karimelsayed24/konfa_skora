import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../model/question_response.dart';
import 'questions_api_services.dart';

abstract class QuestionsRemoteDs {
    Future<Either<ErrorModel, QuestionResponse>> getQuestions();

}

class  QuestionsRemoteDsImpl extends QuestionsRemoteDs {
  final QuestionsApiServices api;
  QuestionsRemoteDsImpl(this.api);
  @override
  Future<Either<ErrorModel, QuestionResponse>> getQuestions() {
    return api.getQuestions();
  } 
}