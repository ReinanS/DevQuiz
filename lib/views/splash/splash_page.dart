import 'package:dev_quiz/core/app_gradients.dart';
import 'package:dev_quiz/core/app_images.dart';
import 'package:dev_quiz/core/app_routes.dart';
import 'package:dev_quiz/views/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatelessWidget {
  void setTheme(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    SettingsController settingsController = SettingsController.instance;

    if (prefs.containsKey("theme")) {
      int? savedTheme = prefs.getInt("theme");
      SelectedTheme getTheme = settingsController.getTheme(savedTheme);

      print("saved theme: $savedTheme");
      // print("Enum theme: $getTheme");

      settingsController.changeCurrentAppTheme(getTheme, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    setTheme(context);

    Future.delayed(Duration(seconds: 2)).then(
      (value) => Navigator.pushReplacementNamed(context, AppRoutes.loginRoute),
    );

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.linear,
        ),
        child: Center(
          child: Image.asset(
            AppImages.logo,
          ),
        ),
      ),
    );
  }
}
