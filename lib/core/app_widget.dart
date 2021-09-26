import 'package:dev_quiz/routers/routers.dart';
import 'package:dev_quiz/views/settings/settings_controller.dart';
import 'package:dev_quiz/views/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<SettingsController>(
      create: (context) => SettingsController(),
      builder: (context, _) => MaterialApp(
        title: "DevQuiz",
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        onGenerateRoute: AppRouter.generateRoute,
        theme: context.watch<SettingsController>().currentAppTheme,
      ),
    );
  }
}
