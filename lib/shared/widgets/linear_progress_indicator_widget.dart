import 'package:dev_quiz/core/app_colors.dart';
import 'package:flutter/material.dart';

class LinearProgressIndicatorWidget extends StatelessWidget {
  final double value;

  LinearProgressIndicatorWidget({required this.value});
  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: value,
      backgroundColor: AppColors.chartSecondary,
      valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
    );
  }
}
