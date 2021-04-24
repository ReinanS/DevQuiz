import 'package:dev_quiz/core/core.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
