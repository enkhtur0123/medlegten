import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_answer.freezed.dart';
part 'quiz_answer.g.dart';

@freezed
class QuizAnswer with _$QuizAnswer {
  factory QuizAnswer(String answerId, String answer, String isTrue,
      String ordering, bool? isCorrect) = _QuizAnswer;

  factory QuizAnswer.fromJson(Map<String, dynamic> json) =>
      _$QuizAnswerFromJson(json);
}
