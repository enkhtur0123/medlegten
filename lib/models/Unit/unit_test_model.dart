import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/Unit/unit_test_question_model.dart';

part 'unit_test_model.freezed.dart';
part 'unit_test_model.g.dart';

@freezed
class UnitTestModel with _$UnitTestModel {
  factory UnitTestModel(String examId, String examName, String examType,
      List<UnitTestQuestionModel> questions) = _UnitTestModel;

  factory UnitTestModel.fromJson(Map<String, dynamic> json) =>
      _$UnitTestModelFromJson(json);
}
