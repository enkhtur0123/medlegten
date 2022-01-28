import 'package:freezed_annotation/freezed_annotation.dart';
part 'version.freezed.dart';
part 'version.g.dart';

@freezed
class Version with _$Version {
  factory Version(bool isSuccess, String errorCode, String resultMessage,
      [String? appVersion,
      String? appVersionDesc,
      String? androidUrl,
      String? iosUrl]) = _Version;

  factory Version.fromJson(Map<String, dynamic> json) =>
      _$VersionFromJson(json);
}
