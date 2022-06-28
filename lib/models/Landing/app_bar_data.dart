import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_bar_data.freezed.dart';
part 'app_bar_data.g.dart';

@freezed
class AppBarData with _$AppBarData {
  factory AppBarData(
    String homePageText,
    String coursePageText,
    String ppvPageText,
    String articlePageText) = _AppBarData;

  factory AppBarData.fromJson(Map<String, dynamic> json) =>
      _$AppBarDataFromJson(json);
}
