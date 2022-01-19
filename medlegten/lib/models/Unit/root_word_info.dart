import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/Unit/translation.dart';

part 'root_word_info.freezed.dart';
part 'root_word_info.g.dart';

@freezed
class RootWordInfo with _$RootWordInfo {
  factory RootWordInfo(String? rootWordId, String? rootWord,
      List<Translation>? translation) = _RootWordInfo;

  factory RootWordInfo.fromJson(Map<String, dynamic> json) =>
      _$RootWordInfoFromJson(json);
}
