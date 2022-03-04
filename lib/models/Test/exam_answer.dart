import 'package:freezed_annotation/freezed_annotation.dart';

part 'exam_answer.freezed.dart';
part 'exam_answer.g.dart';

@freezed
class ExamResultAnswer with _$ExamResultAnswer {
  factory ExamResultAnswer(
    String answerId,
    String answer,
    bool isTrue,
    String choosenAnswerId,
    bool isChoosen,
    String ordering,
  ) = _ExamResultAnswer;

  factory ExamResultAnswer.fromJson(Map<String, dynamic> json) =>
      _$ExamResultAnswerFromJson(json);
}
