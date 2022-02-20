import 'package:medlegten/models/Unit/unit_test_question_model.dart';

class ExamQuestionEx {
  ExamQuestionEx(this.quizQuestion);

  UnitTestQuestionModel quizQuestion;
  String? selectedAnswerId;
}

class ExamJson {
  String? examId;
  List<QuestionJson> results = [];

  Map<String, dynamic> toJson() => {
        'examId': examId,
        'results': results,
      };
}

class QuestionJson {
  QuestionJson(this.segmentId, this.questionId, this.answerId);
  String segmentId;
  String questionId;
  String answerId;

  Map<String, dynamic> toJson() => {
        'segmentId': segmentId,
        'questionId': questionId,
        'answerId': answerId,
      };
}
