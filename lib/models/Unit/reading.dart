import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/Unit/reading_cue.dart';

part 'reading.freezed.dart';
part 'reading.g.dart';

@freezed
class Reading with _$Reading {
  factory Reading(String name, String title, String imgUrl,
      List<ReadingCueParagraph> cue) = _Reading;

  factory Reading.fromJson(Map<String, dynamic> json) =>
      _$ReadingFromJson(json);
}
