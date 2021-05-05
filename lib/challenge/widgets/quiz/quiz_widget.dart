import 'package:dev_quiz/challenge/widgets/answer/answer_widget.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final String title;

  QuizWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(title, style: AppTextStyles.heading),
          SizedBox(height: 24),
          AnswerWidget(
            title: "title",
          ),
          AnswerWidget(
            isRight: true,
            isSelected: true,
            title: "title",
          ),
          AnswerWidget(title: "title"),
          AnswerWidget(title: "title"),
        ],
      ),
    );
  }
}
