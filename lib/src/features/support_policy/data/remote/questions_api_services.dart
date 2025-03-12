import 'package:dartz/dartz.dart';

import '../../../../../core/constants/endpoints_strings.dart';
import '../../../../../core/data/api/api_consumer.dart';
import '../../../../../core/errors/error_model.dart';
import '../../../../../core/errors/exceptions.dart';
import '../model/question_response.dart';

abstract class QuestionsApiServices {
  Future<Either<ErrorModel, QuestionResponse>> getQuestions();
}

class QuestionsApiServicesImpl implements QuestionsApiServices {
  final ApiConsumer api;
  
  QuestionsApiServicesImpl(this.api);
  
  @override
  Future<Either<ErrorModel, QuestionResponse>> getQuestions() async {
    try {
      final response = await api.get(EndpointsStrings.getQuestions);
      final questionsResponse = QuestionResponse.fromJson(response);
      return Right(questionsResponse);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
}