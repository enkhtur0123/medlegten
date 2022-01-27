import 'package:medlegten/models/Unit/grammar.dart';
import 'package:medlegten/models/Unit/grammar.dart';
import 'package:medlegten/models/Unit/sentence.dart';
import 'package:medlegten/models/Unit/unit_grammar.dart';
import 'package:tuple/tuple.dart';

class Grammarhelper {
  Grammarhelper(this.unitGrammar);
  UnitGrammar unitGrammar;
  Map<int, int> valueKeyList = {};
  Map<int, String> selectedAnswers = {};
  Map<Tuple2<Grammar, int>, int> selectedChips = {};
  Grammar? selectedGrammar;
  Sentence? selectedSentence;
  List<String> get getPartNames {
    List<String> retVal = [];

    for (var element in unitGrammar.grammar) {
      retVal.add(element.label);
    }

    return retVal;
  }

  Sentence getSentence(Grammar grammar, Map<int, String> selectedAnswers) {
    List<String> _partNames = [];
    selectedAnswers.forEach((key, value) {
      if (key < selectedAnswers.length + 1) {
        _partNames.add(value);
      }
    });
    Sentence? firstSentence;
    List<Sentence> sentences = [];
    for (var sentence in unitGrammar.sentences.where((sentence) =>
        sentence.label.toLowerCase() == grammar.label.toLowerCase())) {
      firstSentence ??= sentence;
      if (selectedGrammar != null &&
          selectedSentence != null &&
          selectedGrammar != grammar) {
        if (selectedSentence!.group == sentence.group) {
          sentences.add(sentence);
        }
      } else {
        if (_partNames.isNotEmpty) {
          bool add = true;
          for (int i = 1; i < 11; i++) {
            if (_partNames.length > i - 1 &&
                sentence.getPart(i) != null &&
                _partNames[i - 1] != '' &&
                sentence.getPart(i) != _partNames[i - 1]) {
              add = false;
              break;
            }
          }

          if (add) {
            sentences.add(sentence);
          }
        } else {
          sentences.add(sentence);
          break;
        }
      }
    }
    selectedSentence = sentences.isNotEmpty ? sentences.first : firstSentence;
    return selectedSentence!;
  }

  int grammarIndex(Grammar grammar) {
    int i = 1;
    for (var element in unitGrammar.grammar) {
      if (element == grammar) {
        return i * 10000;
      } else {
        i++;
      }
    }
    return i * 10000;
  }

  List<GrammarAnswerEx> getPartStructureNames(
      Grammar grammar, int partId, Map<int, String> selectedAnswers) {
    List<String> _partNames = [];
    selectedAnswers.forEach((key, value) {
      if (key < partId) {
        _partNames.add(value);
      }
    });

    List<String> retVal = [];

    for (var sentence in unitGrammar.sentences.where((sentence) =>
        sentence.label.toLowerCase() == grammar.label.toLowerCase())) {
      if (selectedAnswers.isNotEmpty &&
          selectedGrammar != null &&
          selectedGrammar != grammar) {
        var selectedSentence = getSentence(selectedGrammar!, selectedAnswers);
        if (selectedSentence.group != sentence.group) {
          continue;
        } else {
          retVal.add(sentence.getPart(partId)!);
        }
      }

      bool add = true;
      for (int i = 1; i < 11; i++) {
        if (_partNames.length > i - 1 &&
            sentence.getPart(i) != null &&
            _partNames[i - 1] != '' &&
            sentence.getPart(i) != _partNames[i - 1]) {
          add = false;
          break;
        }
      }

      if (add) {
        retVal.add(sentence.getPart(partId)!);
      }
    }

    var distinctIds = [
      ...{...retVal}
    ];

    int i = 0;
    List<GrammarAnswerEx> retValEx = [];
    for (var element in distinctIds) {
      var exElement = GrammarAnswerEx(element);
      exElement.answerId = i++;
      retValEx.add(exElement);
    }

    return retValEx;
  }
}

class GrammarAnswerEx {
  GrammarAnswerEx(this.answer);
  String answer;
  int answerId = 0;
}
