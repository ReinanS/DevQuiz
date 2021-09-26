import 'package:dev_quiz/core/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsController {
  ValueNotifier<ThemeData> themeNotifier =
      ValueNotifier<ThemeData>(AppTheme.lightTheme);
  ThemeData get currentAppTheme => themeNotifier.value;
  set currentAppTheme(ThemeData value) => themeNotifier.value = value;

  void changeCurrentAppTheme(SelectedTheme theme, BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    switch (theme) {
      case SelectedTheme.System:
        _setSystemTheme(prefs, context);
        break;

      case SelectedTheme.Dark:
        _setDarkTheme(prefs);
        break;

      default:
        _setLightTheme(prefs);
    }
  }

  void _setSystemTheme(SharedPreferences prefs, BuildContext context) {
    if (brightness(context) == Brightness.dark) {
      currentAppTheme = AppTheme.darkTheme;
    } else {
      currentAppTheme = AppTheme.lightTheme;
    }

    prefs.setInt("theme", 0);
  }

  void _setDarkTheme(SharedPreferences prefs) {
    currentAppTheme = AppTheme.darkTheme;
    prefs.setInt("theme", 1);
  }

  void _setLightTheme(SharedPreferences prefs) {
    currentAppTheme = AppTheme.lightTheme;
    prefs.setInt("theme", 2);
  }

  Brightness brightness(BuildContext context) =>
      MediaQuery.platformBrightnessOf(context);

  // getCurrentBrightness() {
  //   return WidgetsBinding.instance!.window.platformBrightness;
  // }

  SelectedTheme getTheme(int? theme) {
    switch (theme) {
      case 0:
        return SelectedTheme.System;

      case 1:
        return SelectedTheme.Dark;

      default:
        return SelectedTheme.Light;
    }
  }
}

enum SelectedTheme { System, Dark, Light }
