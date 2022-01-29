import 'package:freezed_annotation/freezed_annotation.dart';

part 'muser_info.freezed.dart';
part 'muser_info.g.dart';

@freezed
class MUserInfo with _$MUserInfo {
  factory MUserInfo(
      String userId,
      String? socialId,
      String? firstName,
      String? lastName,
      String? phone,
      String? email,
      String? profileUrl,
      String? socialType,
      String? createdDate,
      String? birthDate,
      String? deviceInfo,
      String? skipBirthDate) = _MUserInfo;

  factory MUserInfo.fromJson(Map<String, dynamic> json) =>
      _$MUserInfoFromJson(json);
}
