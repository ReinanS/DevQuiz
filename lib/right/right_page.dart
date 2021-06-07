import 'package:dev_quiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:dev_quiz/core/app_images.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:flutter/material.dart';

class RightPage extends StatelessWidget {
  const RightPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset(AppImages.check),
                  SizedBox(height: size.height * 0.05),
                  Text(
                    "Acertou !",
                    style: AppTextStyles.heading40,
                  ),
                  SizedBox(height: size.height * 0.03),
                  SizedBox(
                    width: 250,
                    child: Text(
                      "É um kit de desenvolvimento de interface de usuário",
                      style: AppTextStyles.body,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 58),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 68),
                          child: NextButtonWidget.purple(
                              label: "Avançar", onTap: () {}),
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
