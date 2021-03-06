import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/views/challenge/widgets/next_button/next_button_widget.dart';
import 'package:dev_quiz/views/login/login_page.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset(
                    AppImages.colorfulLogo,
                    height: size.height * 0.3,
                    color: AppColors.purple,
                    alignment: Alignment.topLeft,
                  ),
                  SizedBox(height: size.height * 0.05),
                  Text(
                    "Bem-vindo ao Dev Quiz!",
                    style: AppTextStyles.heading20,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: size.height * 0.03),
                  SizedBox(
                    width: 250,
                    child: Text(
                      "O aplicativo que vai elevar o seu sucesso!",
                      style: AppTextStyles.body,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    height: size.height * 0.18,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _button(
                          NextButtonWidget.purple(
                              label: "Fazer Cadastro", onTap: () {}),
                          size,
                        ),
                        _button(
                          NextButtonWidget.white(
                              label: "Entrar",
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              }),
                          size,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _button(Widget child, Size size) {
    return Row(
      children: [
        Expanded(child: child),
      ],
    );
  }
}
