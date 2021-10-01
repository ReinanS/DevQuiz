import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/views/challenge/widgets/answer/answer_widget.dart';
import 'package:dev_quiz/views/settings/settings_controller.dart';
import 'package:dev_quiz/views/shared/models/answer_model.dart';
import 'package:dev_quiz/views/shared/models/question_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Tarefa extra:
// Implementar bloqueio ao selecionar uma alternativa
// Aplicar diferentes result page de acordo com a pontuacao do usuario

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<bool> onSelected;

  QuizWidget({
    required this.question,
    required this.onSelected,
  });

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;

  AnswerModel answer(int index) => widget.question.answers[index];

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 30),
          Text(
            widget.question.title,
            style: AppTextStyles.heading
                .copyWith(color: Theme.of(context).primaryColor),
          ),
          SizedBox(height: 24),
          for (int i = 0; i < widget.question.answers.length; i++)
            AnswerWidget(
              answer: answer(i),
              disabled: indexSelected != -1,
              isSelected: indexSelected == i,
              onTap: (value) {
                indexSelected = i;

                setState(() {});
                Future.delayed(Duration(seconds: 1))
                    .then((_) => widget.onSelected(value));
              },
            ),

          // Uso de operador de screed. Concatena a lista
          // ...widget.question.answers
          //     .map(
          //       (e) => AnswerWidget(
          //         title: e.title,
          //         isRight: e.isRight,
          //       ),
          //     )
          //     .toList(),
        ],
      ),
    );
  }
}
