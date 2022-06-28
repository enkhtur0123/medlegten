
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/Landing/quiz_question.dart';

part 'unit_listening_cue.freezed.dart';
part 'unit_listening_cue.g.dart';

@freezed
class ListeningCue with _$ListeningCue {
  factory ListeningCue(String cueId, String hostUrl, String hostSource,String ordering,String title,
      List<QuizQuestion> questions) = _ListeningCue;

  factory ListeningCue.fromJson(Map<String, dynamic> json) =>
     _$ListeningCueFromJson(json);

}
