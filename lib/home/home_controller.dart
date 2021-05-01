import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/home/home_state.dart';
import 'package:dev_quiz/shared/models/answer_model.dart';
import 'package:dev_quiz/shared/models/question_model.dart';
import 'package:dev_quiz/shared/models/quiz_model.dart';
import 'package:dev_quiz/shared/models/user_model.dart';

class HomeController {
  HomeState state = HomeState.empty;

  UserModel? user;
  List<QuizModel>? quizzes;

  void getUser() {
    user = UserModel(
      name: "Reinan",
      photoUrl:
          "https://avatars.githubusercontent.com/u/51024246?s=400&u=019c026a1e966e5fe215bdedbe7d4016b7a7a232&v=4",
    );
  }

  void getQuizzes() {
    quizzes = [
      QuizModel(
          title: "NLW 5 Flutter",
          imagem: AppImages.blocks,
          level: Level.facil,
          questions: [
            QuestionModel(title: "Está Curtindo?", answers: [
              AnswerModel(title: "Estou curtindo"),
              AnswerModel(title: "Não Estou curtindo"),
              AnswerModel(title: "Estou gostando", isRight: true),
              AnswerModel(title: "Legal"),
            ])
          ])
    ];
  }
}
