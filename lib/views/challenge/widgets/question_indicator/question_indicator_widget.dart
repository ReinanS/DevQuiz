import 'package:dev_quiz/views/shared/widgets/linear_progress_indicator_widget.dart';
import 'package:flutter/material.dart';

import 'package:dev_quiz/core/core.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentPage;
  final int length;
  const QuestionIndicatorWidget({
    Key? key,
    required this.currentPage,
    required this.length,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Questão $currentPage",
                style: AppTextStyles.body.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Text(
                "de $length",
                style: AppTextStyles.body.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          LinearProgressIndicatorWidget(value: currentPage / length),
        ],
      ),
    );
  }
}
