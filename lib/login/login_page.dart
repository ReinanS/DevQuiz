import 'package:dev_quiz/core/core.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      body: buildBody(deviceSize),
    );
  }

  SingleChildScrollView buildBody(Size deviceSize) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.colorfulLogo,
            height: deviceSize.height * 0.3,
          ),
        ],
      ),
    );
  }
}
