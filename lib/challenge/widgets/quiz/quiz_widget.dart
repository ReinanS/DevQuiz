import 'package:dev_quiz/challenge/widgets/answer/answer_widget.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final QuestionModel question;

  QuizWidget({
    required this.question,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 30),
          Text(
            question.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(height: 24),
          // Uso de operador de screed. Concatena a lista
          ...question.answers
              .map(
                (e) => AnswerWidget(
                  title: e.title,
                  isRight: e.isRight,
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
