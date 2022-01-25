import 'package:freezed_annotation/freezed_annotation.dart';

part 'sentence_structure.freezed.dart';
part 'sentence_structure.g.dart';

@freezed
class SentenceStructure with _$SentenceStructure {
  factory SentenceStructure(
      String? part1,
      String? part2,
      String? part3,
      String? part4,
      String? part5,
      String? part6,
      String? part7,
      String? part8,
      String? part9,
      String? part10) = _SentenceStructure;

  factory SentenceStructure.fromJson(Map<String, dynamic> json) =>
      _$SentenceStructureFromJson(json);

  const SentenceStructure._();

  String? getPart(int id) {
    String? retVal = '';
    switch (id) {
      case 1:
        retVal = part1;
        break;
      case 2:
        retVal = part2;
        break;
      case 3:
        retVal = part3;
        break;
      case 4:
        retVal = part4;
        break;
      case 5:
        retVal = part5;
        break;
      case 6:
        retVal = part6;
        break;
      case 7:
        retVal = part7;
        break;
      case 8:
        retVal = part8;
        break;
      case 9:
        retVal = part9;
        break;
      case 10:
        retVal = part10;
        break;
    }
    return retVal;
  }
}
