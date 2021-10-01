import 'package:dev_quiz/core/app_theme.dart';
import 'package:dev_quiz/routers/routers.dart';
import 'package:dev_quiz/views/settings/settings_controller.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: SettingsController.instance,
      builder: (context, _) => MaterialApp(
        title: "DevQuiz",
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        onGenerateRoute: AppRouter.generateRoute,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: SettingsController.instance.currentThemeMode,
      ),
    );
  }
}
