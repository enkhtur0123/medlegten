import 'package:freezed_annotation/freezed_annotation.dart';
part 'last_seen_unit.freezed.dart';
part 'last_seen_unit.g.dart';

@freezed
class LastSeenUnit with _$LastSeenUnit {
  factory LastSeenUnit(
     String unitId,
    String unitName,
    String unitNumber,
    String moduleId,
    String moduleTypeId,
    String moduleTypeName,
    int completedCount,
    int unCompletedCount) = _LastSeenUnit;

  factory LastSeenUnit.fromJson(Map<String, dynamic> json) =>
      _$LastSeenUnitFromJson(json);
}
