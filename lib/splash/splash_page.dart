import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/home/home_page.dart';
import 'package:dev_quiz/welcome/welcome_page.dart';
import 'package:dev_quiz/right/right_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then(
      (value) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          // return HomePage();
          return WelcomePage();
        }),
      ),
    );

    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Container(
      decoration: BoxDecoration(gradient: AppGradients.linear),
      child: Center(
        child: Image.asset(AppImages.logo),
      ),
    );
  }
}
