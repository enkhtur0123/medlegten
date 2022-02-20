// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_test_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnitTestModel _$$_UnitTestModelFromJson(Map<String, dynamic> json) =>
    _$_UnitTestModel(
      json['examId'] as String,
      json['examName'] as String,
      json['examType'] as String,
      (json['questions'] as List<dynamic>)
          .map((e) => UnitTestQuestionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UnitTestModelToJson(_$_UnitTestModel instance) =>
    <String, dynamic>{
      'examId': instance.examId,
      'examName': instance.examName,
      'examType': instance.examType,
      'questions': instance.questions,
    };
