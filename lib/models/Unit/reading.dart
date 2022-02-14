import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/Unit/reading_cue.dart';

part 'reading.freezed.dart';
part 'reading.g.dart';

@freezed
class Reading with _$Reading {
  factory Reading(
      String name, String title, String imgUrl, List<ReadingCueParagraph> cue,
      {bool? isCompleted}) = _Reading;

  factory Reading.fromJson(Map<String, dynamic> json) =>
      _$ReadingFromJson(json);

  // Reading._();

  // bool? _isCompleted;
  // bool get isCompleted => _isCompleted!;
  // set isCompleted(bool val) => _isCompleted = val;
}
