import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/Unit/unit_listening.dart';

part 'unit_listening_quiz_question.freezed.dart';
part 'unit_listening_quiz_question.g.dart';

@freezed
class ListeningQuiz with _$ListeningQuiz {
  factory ListeningQuiz(bool isSuccess, String errorCode, String resultMessage,
      String moduleTypeId, bool isCompleted,UnitListening listening) = _ListeningQuiz;

  factory ListeningQuiz.fromJson(Map<String, dynamic> json) =>
      _$ListeningQuizFromJson(json);
}
