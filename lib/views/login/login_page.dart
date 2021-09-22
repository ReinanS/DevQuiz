import 'package:dev_quiz/core/app_routes.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/views/challenge/widgets/next_button/next_button_widget.dart';
import 'package:dev_quiz/views/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    SettingsController settingsController =
        Provider.of<SettingsController>(context);

    return Scaffold(
      backgroundColor:
          settingsController.currentAppTheme.scaffoldBackgroundColor,
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
        ),
        Image.asset(
          AppImages.blackgroundLogo,
          height: deviceSize.height * 0.3,
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
            style: AppTextStyles.heading30,
            children: [
              TextSpan(
                text: "ao \n",
                style: AppTextStyles.heading30,
              ),
              TextSpan(
                text: "Dev Quiz!",
                style: AppTextStyles.heading30,
              )
            ],
          )),
          Container(
            margin: EdgeInsets.only(top: 21),
            child: Text(
              "O aplicativo que vai \nelevar o seu sucesso!",
              style: AppTextStyles.body,
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
    await Navigator.of(context).pushNamed(AppRoutes.settingsRoute);
    // await Navigator.of(context).pushNamed(AppRoutes.homeRoute);
  }
}
