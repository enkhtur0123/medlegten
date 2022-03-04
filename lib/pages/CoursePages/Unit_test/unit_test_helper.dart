import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/Test/exam_question.dart';
import 'package:medlegten/models/Unit/unit_test_question_model.dart';

class ExamQuestionEx {
  late QuestionWrapper quizQuestion;
  String? selectedAnswerId;
  ExamQuestionEx.fromExam(UnitTestQuestionModel item) {
    quizQuestion = QuestionWrapper(
        item.questionId,
        item.question,
        item.ordering,
        item.type,
        item.typeText,
        item.segmentId,
        item.segmentName,
        item.answers
            .map((e) =>
                AnswerWrapper(e.answerId, e.answer, e.isTrue, e.ordering))
            .toList());
  }

  ExamQuestionEx.fromResult(ExamResultQuestion item, String segmentName,
      String totalPercent, String ordering) {
    selectedAnswerId = item.answers
        .firstWhereOrNull((element) => element.isChoosen == true)!
        .answerId;

    quizQuestion = QuestionWrapper(
        totalPercent,
        item.question,
        ordering,
        '0',
        '',
        '',
        segmentName,
        item.answers
            .map((e) => AnswerWrapper(
                e.answerId, e.answer, e.isTrue ? '1' : '0', e.ordering))
            .toList());
  }
}

class QuestionWrapper {
  QuestionWrapper(this.questionId, this.question, this.ordering, this.type,
      this.typeText, this.segmentId, this.segmentName, this.answers);
  String questionId;
  String question;
  String ordering;
  String type;
  String typeText;
  String segmentId;
  String segmentName;
  List<AnswerWrapper> answers;
}

class AnswerWrapper {
  AnswerWrapper(this.answerId, this.answer, this.isTrue, this.ordering);
  String answerId;
  String answer;
  String isTrue;
  String ordering;
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
