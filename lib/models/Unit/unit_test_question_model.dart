import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/Landing/quiz_answer.dart';

part 'unit_test_question_model.freezed.dart';
part 'unit_test_question_model.g.dart';

@freezed
class UnitTestQuestionModel with _$UnitTestQuestionModel {
  factory UnitTestQuestionModel(
      String questionId,
      String question,
      String ordering,
      String type,
      String typeText,
      String segmentId,
      String segmentName,
      List<QuizAnswer> answers) = _UnitTestQuestionModel;

  factory UnitTestQuestionModel.fromJson(Map<String, dynamic> json) =>
      _$UnitTestQuestionModelFromJson(json);
}
