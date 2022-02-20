import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/Unit/unit_introduction_cue_word.dart';

part 'article_cue.freezed.dart';
part 'article_cue.g.dart';

@freezed
class ArticleCueParagraph with _$ArticleCueParagraph {
  factory ArticleCueParagraph(
      String cueId,
      String ordering,
      String fromLangId,
      String fromLangTranslation,
      String fromLangIsDefault,
      String toLangId,
      String toLangTranslation,
      List<UnitIntroCueWord> words) = _ArticleCueParagraph;

  factory ArticleCueParagraph.fromJson(Map<String, dynamic> json) =>
      _$ArticleCueParagraphFromJson(json);
}
