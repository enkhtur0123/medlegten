import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/video/sonsgol_word.dart';

part 'sonsgol.freezed.dart';
part 'sonsgol.g.dart';

@freezed
class Sonsgol with _$Sonsgol {
  factory Sonsgol(
      String? cueId,
      String? startTime,
      String? endTime,
      String? fromLangTranslation,
      String? toLangTranslation,
      List<SonsgolWord> words) = _Sonsgol;

  factory Sonsgol.fromJson(Map<String, dynamic> json) =>
      _$SonsgolFromJson(json);
}
