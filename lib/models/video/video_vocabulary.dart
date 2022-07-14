import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/Unit/unit_vocabulary_word.dart';

import 'video_vocabulary_word.dart';

part 'video_vocabulary.freezed.dart';
part 'video_vocabulary.g.dart';

@freezed
class VideoVocabulary with _$VideoVocabulary {
  factory VideoVocabulary(int wordCount, List<VideoVocabularyWord> words) =
      _VideoVocabulary;

  factory VideoVocabulary.fromJson(Map<String, dynamic> json) =>
      _$VideoVocabularyFromJson(json);
}
