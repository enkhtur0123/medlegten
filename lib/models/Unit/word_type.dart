import 'package:freezed_annotation/freezed_annotation.dart';

part 'word_type.freezed.dart';
part 'word_type.g.dart';

@freezed
class WordType with _$WordType {
  factory WordType(
      String wordTypeId, String typeFullName, String typeShortName) = _WordType;

  factory WordType.fromJson(Map<String, dynamic> json) =>
      _$WordTypeFromJson(json);
}
