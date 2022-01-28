import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_units_info.freezed.dart';
part 'course_units_info.g.dart';

@freezed
class CourseUnitsInfo with _$CourseUnitsInfo {
  factory CourseUnitsInfo(
      String unitId,
      String courseId,
      String unitNumber,
      String unitName,
      String hasTrial,
      String isActive,
      String minToWatch) = _CourseUnitsInfo;

  factory CourseUnitsInfo.fromJson(Map<String, dynamic> json) =>
      _$CourseUnitsInfoFromJson(json);
}
