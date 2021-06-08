import 'package:dev_quiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                    AppImages.logo,
                    height: size.height * 0.3,
                    color: AppColors.purple,
                    alignment: Alignment.topLeft,
                  ),
                  SizedBox(height: size.height * 0.05),
                  Text.rich(
                    TextSpan(
                        text: "Bem-vindo \n",
                        style: AppTextStyles.heading40,
                        children: [
                          TextSpan(text: "ao \n"),
                          TextSpan(text: "Dev Quiz!"),
                        ]),
                    textAlign: TextAlign.left,
                  ),
                  // Text(
                  //   "Bem-vindo ao Dev Quiz!",
                  //   style: AppTextStyles.heading40,
                  // ),
                  SizedBox(height: size.height * 0.03),
                  SizedBox(
                    width: 250,
                    child: Text(
                      "O aplicativo que vai elevar o seu sucesso!",
                      style: AppTextStyles.body,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: 58),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 68),
                          child: NextButtonWidget.purple(
                              label: "Login", onTap: () {}),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
