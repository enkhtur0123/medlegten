import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/Landing/quiz_question.dart';

part 'quiz.freezed.dart';
part 'quiz.g.dart';

@freezed
class VideoQuiz with _$VideoQuiz {
  factory VideoQuiz(
    String errorCode,
    int? quizDuration,
    String? resultMessage,
    List<QuizQuestion>? contextQuiz,
    List<QuizQuestion>? vocQuiz,
  ) = _VideoQuiz;

  factory VideoQuiz.fromJson(Map<String, dynamic> json) =>
      _$VideoQuizFromJson(json);
}
