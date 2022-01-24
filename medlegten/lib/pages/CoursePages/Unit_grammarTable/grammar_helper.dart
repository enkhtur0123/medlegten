import 'package:medlegten/models/Unit/unit_grammar.dart';

class Grammarhelper {
  Grammarhelper(this.grammar);
  UnitGrammar grammar;

  List<String> get getPartNames {
    List<String> retVal = [];

    for (var element in grammar.grammar) {
      retVal.add(element.label);
    }

    return retVal;
  }

  List<GrammarAnswerEx> getPartStructureNames(
      String label, String partName, List<String> filterPartNames) {
    List<String> retVal = [];

    for (var element in grammar.sentences.where(
        (element) => element.label.toLowerCase() == label.toLowerCase())) {
      var structure = element.structure;
      if (filterPartNames.isNotEmpty && structure.part1 != filterPartNames[0]) {
        continue;
      }
      if (filterPartNames.length > 1 && structure.part2 != filterPartNames[1]) {
        continue;
      }
      if (filterPartNames.length > 2 && structure.part3 != filterPartNames[2]) {
        continue;
      }
      if (filterPartNames.length > 3 && structure.part4 != filterPartNames[3]) {
        continue;
      }
      if (filterPartNames.length > 4 && structure.part5 != filterPartNames[4]) {
        continue;
      }
      if (filterPartNames.length > 5 && structure.part6 != filterPartNames[5]) {
        continue;
      }
      if (filterPartNames.length > 6 && structure.part7 != filterPartNames[6]) {
        continue;
      }
      if (filterPartNames.length > 7 && structure.part8 != filterPartNames[7]) {
        continue;
      }
      if (filterPartNames.length > 8 && structure.part9 != filterPartNames[8]) {
        continue;
      }
      if (filterPartNames.length > 9 &&
          structure.part10 != filterPartNames[9]) {
        continue;
      }
      if (filterPartNames.length > 10 &&
          structure.part11 != filterPartNames[10]) {
        continue;
      }
      if (filterPartNames.length > 11 &&
          structure.part12 != filterPartNames[11]) {
        continue;
      }
      if (filterPartNames.length > 12 &&
          structure.part13 != filterPartNames[12]) {
        continue;
      }
      if (filterPartNames.length > 13 &&
          structure.part14 != filterPartNames[13]) {
        continue;
      }
      if (filterPartNames.length > 14 &&
          structure.part15 != filterPartNames[14]) {
        continue;
      }
      if (filterPartNames.length > 15 &&
          structure.part16 != filterPartNames[15]) {
        continue;
      }
      if (filterPartNames.length > 16 &&
          structure.part17 != filterPartNames[16]) {
        continue;
      }
      if (filterPartNames.length > 17 &&
          structure.part18 != filterPartNames[17]) {
        continue;
      }
      if (filterPartNames.length > 18 &&
          structure.part19 != filterPartNames[18]) {
        continue;
      }

      switch (partName) {
        case "part1":
          retVal.add(structure.part1!);
          break;
        case "part2":
          retVal.add(structure.part2!);
          break;
        case "part3":
          retVal.add(structure.part3!);
          break;
        case "part4":
          retVal.add(structure.part4!);
          break;
        case "part5":
          retVal.add(structure.part5!);
          break;
        case "part6":
          retVal.add(structure.part6!);
          break;
        // case "part7":
        //   retVal.add(structure.part7!);
        //   break;
        // case "part8":
        //   retVal.add(structure.part8!);
        //   break;
        // case "part9":
        //   retVal.add(structure.part9!);
        //   break;
        // case "part10":
        //   retVal.add(structure.part10!);
        //   break;
        // case "part11":
        //   retVal.add(structure.part11!);
        //   break;
        // case "part12":
        //   retVal.add(structure.part12!);
        //   break;
        // case "part13":
        //   retVal.add(structure.part13!);
        //   break;
        // case "part14":
        //   retVal.add(structure.part14!);
        //   break;
        // case "part15":
        //   retVal.add(structure.part15!);
        //   break;
        // case "part16":
        //   retVal.add(structure.part16!);
        //   break;
        // case "part17":
        //   retVal.add(structure.part17!);
        //   break;
        // case "part18":
        //   retVal.add(structure.part18!);
        //   break;
        // case "part19":
        //   retVal.add(structure.part19!);
        //   break;
        // case "part20":
        //   retVal.add(structure.part20!);
        //   break;
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
