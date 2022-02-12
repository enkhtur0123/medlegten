import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/Unit/unit_writing_video.dart';

part 'unit_writing.freezed.dart';
part 'unit_writing.g.dart';

@freezed
class UnitWriting with _$UnitWriting {
  factory UnitWriting(String name, List<UnitWritingVideo> videos) =
      _UnitWriting;

  factory UnitWriting.fromJson(Map<String, dynamic> json) =>
      _$UnitWritingFromJson(json);
}
