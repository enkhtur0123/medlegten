import 'package:flutter/material.dart';
import 'package:medlegten/models/Unit/grammar.dart';
import 'package:medlegten/models/Unit/sentence.dart';
import 'package:medlegten/models/Unit/unit_grammar.dart';
import 'package:tuple/tuple.dart';

class Grammarhelper {
  Grammarhelper(this.unitGrammar);
  UnitGrammar unitGrammar;

  // Map<int, String> selectedAnswersCombined() {
  //   return {}
  //     ..addAll(selectedAnswers)
  //     ..addAll(selectedAnswersAuto);
  // }

  //Map<int, int> valueKeyList = {};
  Map<int, String> selectedAnswers = {};
  Map<int, int> selectedChips = {};
  Grammar? selectedGrammar;
  Sentence? selectedSentence;
  int selectedLabelId = -1;
  Map<Tuple2<Grammar, int>, GlobalKey> labelWidgets = {};

  Map<int, int> get avatarParts => {
        1: int.tryParse(unitGrammar.grammar[0].part1) ?? -1,
        2: int.tryParse(unitGrammar.grammar[0].part2) ?? -1,
        3: int.tryParse(unitGrammar.grammar[0].part3) ?? -1,
        4: int.tryParse(unitGrammar.grammar[0].part4) ?? -1,
        5: int.tryParse(unitGrammar.grammar[0].part5) ?? -1,
        6: int.tryParse(unitGrammar.grammar[0].part6) ?? -1,
      };
  String get avatarUrl => unitGrammar.grammar[0].avatar;
  int getNextAvatarPart(int id) {
    return avatarParts[id]!;
  }

  List<String> get getPartNames {
    List<String> retVal = [];

    for (var element in unitGrammar.grammar) {
      retVal.add(element.label);
    }

    return retVal;
  }

  Sentence getSentence(Grammar grammar) {
    List<String> _partNames = [];
    var prefixNumber = grammarIndex(grammar);
    selectedAnswers.keys.toList()
      ..sort()
      ..forEach((key) {
        if (key > prefixNumber && key < prefixNumber + 9999) {
          //  if (key < prefixNumber + selectedAnswers.length + 6) {
          _partNames.add(selectedAnswers[key]!);
          //  }
        }
      });
    Sentence? firstSentence;
    List<Sentence> sentences = [];
    for (var sentence in unitGrammar.sentences.where((sentence) =>
        sentence.grammarLabel.toLowerCase() == grammar.label.toLowerCase())) {
      firstSentence ??= sentence;
      if (selectedGrammar != null &&
          selectedSentence != null &&
          selectedGrammar != grammar) {
        if (selectedSentence!.groupNumber == sentence.groupNumber) {
          sentences.add(sentence);
        }
      } else {
        if (_partNames.isNotEmpty) {
          bool add = true;
          for (int i = 1; i < 7; i++) {
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

  List<GrammarAnswerEx> getPartStructureNames(Grammar grammar, int partId) {
    List<String> _partNames = [];
    var prefixNumber = grammarIndex(grammar);
    selectedAnswers.keys.toList()
      ..sort()
      ..forEach((key) {
        if (key > prefixNumber && key < prefixNumber + 9999) {
          if (key < partId + prefixNumber) {
            _partNames.add(selectedAnswers[key]!);
          }
        }
      });

    List<String> retVal = [];

    for (var sentence in unitGrammar.sentences.where((sentence) =>
        sentence.grammarLabel.toLowerCase() == grammar.label.toLowerCase())) {
      if (selectedAnswers.isNotEmpty &&
          selectedGrammar != null &&
          selectedGrammar != grammar) {
        var selectedSentence = getSentence(selectedGrammar!);
        if (selectedSentence.groupNumber != sentence.groupNumber) {
          continue;
        } else {
          retVal.add(sentence.getPart(partId)!);
        }
      }

      bool add = true;
      for (int i = 1; i < 7; i++) {
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

  List<GrammarAnswerEx> getAllPartStructureNames(Grammar grammar, int partId) {
    List<String> retVal = [];

    for (var sentence in unitGrammar.sentences.where((sentence) =>
        sentence.grammarLabel.toLowerCase() == grammar.label.toLowerCase())) {
      if (sentence.getPart(partId) != null) {
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GrammarAnswerEx &&
          runtimeType == other.runtimeType &&
          answer == other.answer;

  @override
  int get hashCode => answer.hashCode;
}
