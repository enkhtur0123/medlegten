import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/Landing/course_unit.dart';

import 'course_unit_module_list.dart';
part 'last_seen_unit_info.freezed.dart';
part 'last_seen_unit_info.g.dart';

@freezed
class LastSeenUnitInfo with _$LastSeenUnitInfo {
  factory LastSeenUnitInfo(CourseUnitModuleList? moduleInfo, CourseUnit? unitInfo) = _LastSeenUnitInfo;

  factory LastSeenUnitInfo.fromJson(Map<String, dynamic> json) =>
      _$LastSeenUnitInfoFromJson(json);
}
