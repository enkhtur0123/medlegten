import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/Landing/quiz_question.dart';

part 'self_quiz.freezed.dart';
part 'self_quiz.g.dart';

@freezed
class SelfQuiz with _$SelfQuiz {
  factory SelfQuiz(String quizId, List<QuizQuestion> questions) = _SelfQuiz;

  factory SelfQuiz.fromJson(Map<String, dynamic> json) =>
      _$SelfQuizFromJson(json);
}
