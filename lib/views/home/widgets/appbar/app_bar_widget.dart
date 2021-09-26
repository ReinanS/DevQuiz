import 'package:dev_quiz/core/app_routes.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/views/home/widgets/score_card/score_card_widget.dart';
import 'package:dev_quiz/views/shared/models/user_model.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;
  final Size size;
  final BuildContext context;

  AppBarWidget({
    required this.user,
    required this.size,
    required this.context,
  }) : super(
          preferredSize: Size.fromHeight(size.height * 0.43),
          child: Container(
            height: size.height * 0.4,
            child: Stack(
              children: <Widget>[
                Container(
                  height: size.height * 0.25,
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(gradient: AppGradients.linear),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text.rich(
                        TextSpan(
                          text: "Olá, ",
                          style: AppTextStyles.title,
                          children: [
                            TextSpan(
                              text: user.name,
                              style: AppTextStyles.titleBold,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await Navigator.pushNamed(
                              context, AppRoutes.settingsRoute);
                        },
                        child: Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(user.photoUrl)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment(0.0, 1.0),
                  child: ScoreCardWidget(
                    percent: user.score / 100,
                  ),
                ),
              ],
            ),
          ),
        );
}
