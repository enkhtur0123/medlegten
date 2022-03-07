import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_info.freezed.dart';
part 'course_info.g.dart';

@freezed
class CourseInfo with _$CourseInfo {
  factory CourseInfo(
      String courseId,
      String courseName,
      String price,
      String introVideo,
      String ordering,
      String shortDesc,
      String levelName,
      String hours,
      String units,
      String vocCount,
      String introVideoHostType,
      String introVideoUrl,
      String minToWatch,
      bool isPurchased,
      String purchaseExpireDate,
      bool isCreatedPlan,
      List<String> purchaseDesc,
      String isReady,
      ) = _CourseInfo;

  factory CourseInfo.fromJson(Map<String, dynamic> json) =>
      _$CourseInfoFromJson(json);
}
