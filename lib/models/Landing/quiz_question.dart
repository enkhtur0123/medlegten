import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/Landing/quiz_answer.dart';

part 'quiz_question.freezed.dart';
part 'quiz_question.g.dart';

@freezed
class QuizQuestion with _$QuizQuestion {
  factory QuizQuestion(
      String? questionId,
      String? question,
      String? ordering,
      String? type,
      String? typeText,
      List<QuizAnswer>? answers) = _QuizQuestion;

  factory QuizQuestion.fromJson(Map<String, dynamic> json) =>
      _$QuizQuestionFromJson(json);
}
