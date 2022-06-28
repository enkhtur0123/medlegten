import 'package:freezed_annotation/freezed_annotation.dart';

part 'unit_complete_percent.freezed.dart';
part 'unit_complete_percent.g.dart';

@freezed
class UnitCompleteInfo with _$UnitCompleteInfo {
  factory UnitCompleteInfo(
      bool isSuccess,
      String errorCode,
      String resultMessage,
      int completedCount,
      int unCompletedCount) = _UnitCompleteInfo;

  factory UnitCompleteInfo.fromJson(Map<String, dynamic> json) =>
      _$UnitCompleteInfoFromJson(json);
}
