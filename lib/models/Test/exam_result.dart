import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/Test/exam_question.dart';

part 'exam_result.freezed.dart';
part 'exam_result.g.dart';

@freezed
class ExamResult with _$ExamResult {
  factory ExamResult(String segmentName, String totalPercent,
      List<ExamResultQuestion> questions) = _ExamResult;

  factory ExamResult.fromJson(Map<String, dynamic> json) =>
      _$ExamResultFromJson(json);
}
