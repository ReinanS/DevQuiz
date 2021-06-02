import 'package:dev_quiz/challenge/challenge_page.dart';
import 'package:dev_quiz/challenge/challenge_page.dart';
import 'package:dev_quiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/home/home_controller.dart';
import 'package:dev_quiz/home/home_state.dart';
import 'package:dev_quiz/home/widgets/appbar/app_bar_widget.dart';
import 'package:dev_quiz/home/widgets/level_button/level_button_widget.dart';
import 'package:dev_quiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();

    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    int selectedIndex = 0;
    final List categories = ['Fácil', 'Médio', 'Difícil', 'Perito'];

    if (controller.state == HomeState.sucess) {
      return Scaffold(
        appBar: AppBarWidget(
          user: controller.user!,
          size: size,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              SizedBox(height: 24),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                height: 30,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                          print(selectedIndex);
                        },
                        child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                                left: index == 0 ? 0 : 10,
                                right: index == categories.length - 1 ? 10 : 0),
                            child: LevelButtonWidget(label: categories[index])),
                      );
                    }),
              ),
              SizedBox(height: 24),
              Expanded(
                child: GridView.count(
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    crossAxisCount: 2,
                    children: controller.quizzes!
                        .map(
                          (e) => QuizCardWidget(
                            title: e.title,
                            completed:
                                "${e.questionsAnswered}/${e.questions.length}",
                            percent: e.questionsAnswered / e.questions.length,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChallengePage(
                                      questions: e.questions,
                                      title: e.title,
                                    ),
                                  ));
                              // print("Funciona");
                            },
                          ),
                        )
                        .toList()),
              )
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }
  }
}
