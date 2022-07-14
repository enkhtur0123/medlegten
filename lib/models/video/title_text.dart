import 'package:freezed_annotation/freezed_annotation.dart';

part 'title_text.freezed.dart';
part 'title_text.g.dart';

@freezed
class TitleText with _$TitleText {
  factory TitleText(String startPageTitle, String ppvPageTitle) = _TitleText;

  factory TitleText.fromJson(Map<String, dynamic> json) =>
      _$TitleTextFromJson(json);
}
