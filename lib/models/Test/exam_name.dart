import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/Test/exam_result.dart';

part 'exam_name.freezed.dart';
part 'exam_name.g.dart';

@freezed
class ExamName with _$ExamName {
  factory ExamName(String examName, List<ExamResult> examResult) = _ExamName;

  factory ExamName.fromJson(Map<String, dynamic> json) =>
      _$ExamNameFromJson(json);
}
