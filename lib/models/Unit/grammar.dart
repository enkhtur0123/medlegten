import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/Unit/grammar_structure.dart';

part 'grammar.freezed.dart';
part 'grammar.g.dart';

@freezed
class Grammar with _$Grammar {
  factory Grammar(
      String grammarNameEng,
      String grammarNameMon,
      String label,
      String avatar,
      String avatarHostSource,
      String part1,
      String part2,
      String part3,
      String part4,
      String part5,
      String part6,
      String? part7,
      String? part8,
      String? part9,
      String? part10,
      String? part11,
      String? part12,
      String? part13,
      String? part14,
      String? part15,
      String? part16,
      String? part17,
      String? part18,
      String? part19,
      String? part20,
      List<GrammarStructure> structure) = _Grammar;

  factory Grammar.fromJson(Map<String, dynamic> json) =>
      _$GrammarFromJson(json);

  const Grammar._();

  String? getPart(int id) {
    String? retVal = '';
    retVal = structure.length > id - 1 ? structure[id - 1].nameEng : null;
    // switch (id) {
    //   case 1:
    //     retVal = structure.isNotEmpty ? structure[0].nameEng : null;
    //     break;
    //   case 2:
    //     retVal = structure.length > 1 ? structure[1].nameEng : null;
    //     break;
    //   case 3:
    //     retVal = structure.length > 2 ? structure[2].nameEng : null;
    //     break;
    //   case 4:
    //     retVal = structure.length > 3 ? structure[3].nameEng : null;
    //     break;
    //   case 5:
    //     retVal = structure.length > 4 ? structure[4].nameEng : null;
    //     break;
    //   case 6:
    //     retVal = structure.length > 5 ? structure[5].nameEng : null;
    //     break;
    // }
    return retVal;
  }

  int getPartCount() {
    int retVal = structure.length;

    // if (structure.isNotEmpty) {
    //   retVal++;
    // }
    // if (structure.length > 1) {
    //   retVal++;
    // }
    // if (structure.length > 2) {
    //   retVal++;
    // }
    // if (structure.length > 3) {
    //   retVal++;
    // }
    // if (structure.length > 4) {
    //   retVal++;
    // }
    // if (structure.length > 5) {
    //   retVal++;
    // }

    return retVal;
  }
}
