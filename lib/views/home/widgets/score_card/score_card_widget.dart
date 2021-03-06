import 'package:dev_quiz/core/app_theme.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/views/home/widgets/chart/chart.widget.dart';
import 'package:dev_quiz/views/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScoreCardWidget extends StatelessWidget {
  final double percent;

  const ScoreCardWidget({
    Key? key,
    required this.percent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: size.height * 0.20,
        decoration: BoxDecoration(
          color: AppTheme.backgroundColors(Theme.of(context).brightness),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: ChartWidget(
                  percent: percent,
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Vamos começar",
                          style: AppTextStyles.heading
                              .copyWith(color: Theme.of(context).primaryColor)),
                      SizedBox(height: 8),
                      Text(
                        "Complete os desafios e avance em conhecimento.",
                        style: AppTextStyles.body
                            .copyWith(color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
