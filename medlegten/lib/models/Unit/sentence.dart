import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/Unit/sentence_structure.dart';

part 'sentence.freezed.dart';
part 'sentence.g.dart';

@freezed
class Sentence with _$Sentence {
  factory Sentence(String group, String label, String textEng, String textMon,
      List<SentenceStructure> structure) = _Sentence;

  factory Sentence.fromJson(Map<String, dynamic> json) =>
      _$SentenceFromJson(json);

  const Sentence._();

  String? getPart(int id) {
    String? retVal = '';
    switch (id) {
      case 1:
        retVal = structure.isNotEmpty ? structure[0].word : null;
        break;
      case 2:
        retVal = structure.length > 1 ? structure[1].word : null;
        break;
      case 3:
        retVal = structure.length > 2 ? structure[2].word : null;
        break;
      case 4:
        retVal = structure.length > 3 ? structure[3].word : null;
        break;
      case 5:
        retVal = structure.length > 4 ? structure[4].word : null;
        break;
      case 6:
        retVal = structure.length > 5 ? structure[5].word : null;
        break;
    }
    return retVal;
  }
}
