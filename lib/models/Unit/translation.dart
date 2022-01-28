import 'package:freezed_annotation/freezed_annotation.dart';

part 'translation.freezed.dart';
part 'translation.g.dart';

@freezed
class Translation with _$Translation {
  factory Translation(
      String wordTrId,
      String trText,
      String trOrigin,
      String trTypeId,
      String trTypeFullName,
      String trTypeShortName) = _Translation;

  factory Translation.fromJson(Map<String, dynamic> json) =>
      _$TranslationFromJson(json);
}
