import 'package:dev_quiz/core/app_routes.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/views/challenge/widgets/next_button/next_button_widget.dart';
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

  Widget buildBody(Size deviceSize) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: deviceSize.width * 0.15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _loginImages(deviceSize),
            _loginText(deviceSize),
            _loginButton(deviceSize),
          ],
        ),
      ),
    );
  }

  Widget _loginImages(Size deviceSize) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          AppImages.colorfulLogo,
          height: deviceSize.height * 0.3,
          width: deviceSize.width * 0.25,
        ),
        Image.asset(
          AppImages.blackgroundLogo,
          width: deviceSize.width * 0.25,
        ),
      ],
    );
  }

  Widget _loginText(Size deviceSize) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(TextSpan(
            text: "Bem-vindo \n",
            style: AppTextStyles.heading30
                .copyWith(color: Theme.of(context).primaryColor),
            children: [
              TextSpan(
                text: "ao \n",
                style: AppTextStyles.heading30
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
              TextSpan(
                text: "Dev Quiz!",
                style: AppTextStyles.heading30
                    .copyWith(color: Theme.of(context).primaryColor),
              )
            ],
          )),
          Container(
            margin: EdgeInsets.only(top: 21),
            child: Text(
              "O aplicativo que vai \nelevar o seu sucesso!",
              style: AppTextStyles.body
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget _loginButton(Size deviceSize) {
    return Row(
      children: [
        Expanded(
          child: NextButtonWidget.purple(
            label: "Login",
            onTap: _loginSign,
          ),
        )
      ],
    );
  }

  void _loginSign() async {
    await Navigator.of(context).pushNamed(AppRoutes.homeRoute);
  }
}
