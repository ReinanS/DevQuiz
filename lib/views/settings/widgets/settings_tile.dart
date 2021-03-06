import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/views/settings/settings_controller.dart';
import 'package:flutter/material.dart';

import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:provider/provider.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final bool switchValue;
  final Function(bool) onChanged;
  const SettingsTile({
    Key? key,
    required this.title,
    required this.switchValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.heading.copyWith(
            color: Theme.of(context).primaryColor,
          ),
        ),
        Switch(
          value: this.switchValue,
          onChanged: onChanged,
          activeColor: AppColors.purple,
        ),
      ],
    );
  }
}
