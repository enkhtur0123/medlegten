import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_unit_module_list.freezed.dart';
part 'course_unit_module_list.g.dart';

@freezed
class CourseUnitModuleList with _$CourseUnitModuleList {
  factory CourseUnitModuleList(
      String id,
      String unitId,
      String moduleId,
      String moduleTypeId,
      String moduleTypeName,
      String mandatory) = _CourseUnitModuleList;

  factory CourseUnitModuleList.fromJson(Map<String, dynamic> json) =>
      _$CourseUnitModuleListFromJson(json);
}
