import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/Landing/quiz_question.dart';

part 'quiz.freezed.dart';
part 'quiz.g.dart';

@freezed
class VideoQuiz with _$VideoQuiz {
  factory VideoQuiz(
    int? quizDuration,
    List<QuizQuestion>? contextQuiz,
    List<QuizQuestion>? vocQuiz,
  ) = _VideoQuiz;

  factory VideoQuiz.fromJson(Map<String, dynamic> json) =>
      _$VideoQuizFromJson(json);
}
