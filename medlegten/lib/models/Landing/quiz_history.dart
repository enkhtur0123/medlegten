import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_history.freezed.dart';
part 'quiz_history.g.dart';

@freezed
class QuizHistory with _$QuizHistory {
  factory QuizHistory(String quizId, String quizName, String correctCount,
      String incorrectCount, String createdAt) = _QuizHistory;

  factory QuizHistory.fromJson(Map<String, dynamic> json) =>
      _$QuizHistoryFromJson(json);
}
