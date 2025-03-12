import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../../data/model/question_response.dart';
import '../../data/remote/questions_remote_ds.dart';

abstract class QuestionsRepository {
  Future<Either<ErrorModel, QuestionResponse>> getQuestions();
}

class QuestionsRepositoryImpl implements QuestionsRepository {
  final QuestionsRemoteDs remote;
  
  QuestionsRepositoryImpl(this.remote);
  
  @override
  Future<Either<ErrorModel, QuestionResponse>> getQuestions() async {
    return await remote.getQuestions();
  }
}