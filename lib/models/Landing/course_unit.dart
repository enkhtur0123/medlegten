import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_unit.freezed.dart';
part 'course_unit.g.dart';

@freezed
class CourseUnit with _$CourseUnit {
  factory CourseUnit(
      String unitId,
      String courseId,
      String unitNumber,
      String unitName,
      String hasTrial,  
      String minToWatch,
      bool openUnit,
      bool isCompleted,
     ) = _CourseUnit;

  factory CourseUnit.fromJson(Map<String, dynamic> json) =>
      _$CourseUnitFromJson(json);
}
