import 'package:freezed_annotation/freezed_annotation.dart';

part 'grammar_structure.freezed.dart';
part 'grammar_structure.g.dart';

@freezed
class GrammarStructure with _$GrammarStructure {
  factory GrammarStructure(
          String part, String nameEng, String nameMon, String nameShort) =
      _GrammarStructure;

  factory GrammarStructure.fromJson(Map<String, dynamic> json) =>
      _$GrammarStructureFromJson(json);

  //const SentenceStructure._();

  // String? getPart(int id) {
  //   String? retVal = '';
  //   switch (id) {
  //     case 1:
  //       retVal = part1;
  //       break;
  //     case 2:
  //       retVal = part2;
  //       break;
  //     case 3:
  //       retVal = part3;
  //       break;
  //     case 4:
  //       retVal = part4;
  //       break;
  //     case 5:
  //       retVal = part5;
  //       break;
  //     case 6:
  //       retVal = part6;
  //       break;
  //     case 7:
  //       retVal = part7;
  //       break;
  //     case 8:
  //       retVal = part8;
  //       break;
  //     case 9:
  //       retVal = part9;
  //       break;
  //     case 10:
  //       retVal = part10;
  //       break;
  //   }
  //   return retVal;
  // }
}
