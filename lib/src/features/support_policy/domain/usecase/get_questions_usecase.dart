import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../../data/model/question_response.dart';
import '../repo/questions_repository.dart';

class GetQuestionsUseCase {
  final QuestionsRepository repository;
  
  GetQuestionsUseCase(this.repository);
  
  Future<Either<ErrorModel, QuestionResponse>> call() async {
    return await repository.getQuestions();
  }
}