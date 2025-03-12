import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/get_questions_usecase.dart';
import 'questions_state.dart';

class QuestionsCubit extends Cubit<QuestionsState> {
  final GetQuestionsUseCase getQuestionsUseCase;
  
  QuestionsCubit( this.getQuestionsUseCase) 
      : super(const QuestionsState.initial());
  
  Future<void> getQuestions() async {
    emit(const QuestionsState.loading());
    
    final result = await getQuestionsUseCase.call();
    
    result.fold(
      (failure) => emit(QuestionsState.error(failure.message)),
      (questions) => emit(QuestionsState.loaded(questions)),
    );
  }
}
