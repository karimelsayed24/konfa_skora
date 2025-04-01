import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/custom_app_bar.dart';
import '../../data/model/question_response.dart';
import '../logic/questions_cubit.dart';
import '../logic/questions_state.dart';
import '../widgets/question_item.dart';

class SupportPolicyView extends StatelessWidget {
  const SupportPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(context, AppStrings.privacyPolicy),
      body: BlocBuilder<QuestionsCubit, QuestionsState>(
        builder: (context, state) {
          return state.when(
            initial: () {
              return const Center(child: CircularProgressIndicator());
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (questionsResponse) =>
                _buildQuestionsList(questionsResponse),
            error: (message) => Center(child: Text('خطأ: $message')),
          );
        },
      ),
    );
  }

  Widget _buildQuestionsList(QuestionResponse questionsResponse) {
    return ListView.builder(
      itemCount: questionsResponse.data.length,
      itemBuilder: (context, index) {
        final question = questionsResponse.data[index];
        return QuestionItem(question: question);
      },
    );
  }
}
