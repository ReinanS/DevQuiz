import 'package:dev_quiz/core/app_theme.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/views/settings/settings_controller.dart';
import 'package:dev_quiz/views/shared/models/answer_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnswerWidget extends StatelessWidget {
  final AnswerModel answer;
  final bool isSelected;
  final ValueChanged<bool> onTap;
  final bool disabled;

  AnswerWidget({
    required this.answer,
    this.isSelected = false,
    required this.onTap,
    this.disabled = false,
  });

  Color get _selectedColorRight =>
      answer.isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRight =>
      answer.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRight =>
      answer.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRight =>
      answer.isRight ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRight =>
      answer.isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight => answer.isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: disabled,
      child: GestureDetector(
        onTap: () {
          onTap(answer.isRight);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          margin: EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            color: isSelected
                ? _selectedColorCardRight
                : AppTheme.backgroundColors(Theme.of(context).brightness),
            borderRadius: BorderRadius.circular(10),
            border: Border.fromBorderSide(BorderSide(
                color:
                    isSelected ? _selectedBorderCardRight : AppColors.border)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Text(answer.title,
                      style: isSelected
                          ? _selectedTextStyleRight
                          : AppTextStyles.body.copyWith(
                              color: Theme.of(context).primaryColor))),
              Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                    color: isSelected
                        ? _selectedColorRight
                        : AppTheme.backgroundColors(
                            Theme.of(context).brightness),
                    borderRadius: BorderRadius.circular(500),
                    border: Border.fromBorderSide(BorderSide(
                        color: isSelected
                            ? _selectedBorderRight
                            : AppColors.border))),
                child: isSelected
                    ? Icon(
                        _selectedIconRight,
                        size: 16,
                        color: Colors.white,
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
