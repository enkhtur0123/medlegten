import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/Test/exam_answer.dart';

part 'exam_question.freezed.dart';
part 'exam_question.g.dart';

@freezed
class ExamResultQuestion with _$ExamResultQuestion {
  factory ExamResultQuestion(String question, List<ExamResultAnswer> answers) =
      _ExamResultQuestion;

  factory ExamResultQuestion.fromJson(Map<String, dynamic> json) =>
      _$ExamResultQuestionFromJson(json);
}
