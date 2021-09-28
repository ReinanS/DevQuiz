import 'package:dev_quiz/core/app_theme.dart';
import 'package:dev_quiz/views/settings/settings_controller.dart';
import 'package:dev_quiz/views/shared/widgets/linear_progress_indicator_widget.dart';
import 'package:flutter/material.dart';

import 'package:dev_quiz/core/core.dart';
import 'package:provider/provider.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final String img;
  final String completed;
  final double percent;
  final VoidCallback onTap;

  QuizCardWidget({
    required this.title,
    required this.completed,
    required this.percent,
    required this.onTap,
    required this.img,
  }) : assert([
          "hierarchy",
          "data",
          "laptop",
          "blocks",
          "check",
          "error",
          "trophy",
          "logo",
        ].contains(img));

  final config = {
    "hierarchy": AppImages.hierarchy,
    "data": AppImages.data,
    "laptop": AppImages.laptop,
    "blocks": AppImages.blocks,
    "check": AppImages.check,
    "error": AppImages.error,
    "trophy": AppImages.trophy,
    "logo": AppImages.logo,
  };

  String get image => config[img]!;

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Provider.of<SettingsController>(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
          color:
              AppTheme.backgroundColors(controller.currentAppTheme.brightness),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 40,
              width: 40,
              child: Image.asset(image),
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: AppTextStyles.heading15,
            ),
            SizedBox(height: 8),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text(completed, style: AppTextStyles.body11),
                ),
                Expanded(
                  flex: 2,
                  child: LinearProgressIndicatorWidget(value: percent),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
