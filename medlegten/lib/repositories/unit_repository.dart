import 'dart:convert';
import 'package:medlegten/models/Unit/cue_word.dart';
import 'package:medlegten/models/Unit/unit_grammar.dart';
import 'package:medlegten/models/Unit/unit_introduction_video.dart';
import 'package:medlegten/repositories/repository.dart';

class UnitRepository {
  //moduleTypeId =
  Future<UnitIntroVideo?> getUnitIntroVideo(String moduleId) async {
    try {
      final response =
          await dioRepository.instance.get('Course/UnitModule/$moduleId/1');
      final res = json.decode('$response');
      if (res['isSuccess']) {
        return UnitIntroVideo.fromJson(res['introVideo']);
      } else {
        dioRepository.snackBar(res['resultMessage']);
        return null;
      }
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
      return null;
    }
  }

  Future<CueWord?> getCueWord(String word) async {
    try {
      Codec<String, String> stringToBase64 = utf8.fuse(base64);
      var encoded = stringToBase64.encode(word);
      final response = await dioRepository.instance.get('Word/$encoded');
      final res = json.decode('$response');
      if (res['isSuccess']) {
        return CueWord.fromJson(res);
      } else {
        dioRepository.snackBar(res['resultMessage']);
        return null;
      }
    } catch (e) {
      print(e.toString().toUpperCase());
      dioRepository.snackBar(e.toString().toUpperCase());
      return null;
    }
  }

  Future<UnitGrammar?> getUnitGrammar() async {
    var grammarData = {
      "label": "Grammar - To be and pronoun",
      "tosentence": "I saw you dancing in a crowded room",
      "fromsentence": "Чамайг бөөн хүнтэй өрөөнд бүжиглэж байгааг харлаа",
      "grammar": [
        {
          "label": "Positive",
          "structure": {"part1": "Subject", "part2": "To be", "part3": "Object"}
        },
        {
          "label": "Question",
          "structure": {"part1": "To be", "part2": "Subject", "part3": "Object"}
        },
        {
          "label": "Negative",
          "structure": {
            "part1": "Subject",
            "part2": "To be",
            "part3": "Adverb",
            "part4": "Object"
          }
        }
      ],
      "sentences": [
        {
          "label": "positive",
          "eng": "He is a teacher",
          "mon": "Тэр эрэгтэй бол багш",
          "structure": {"part1": "He", "part2": "is", "part3": "teacher"}
        },
        {
          "label": "question",
          "eng": "Is he a teacher?",
          "mon": "Тэр эрэгтэй багш мөн үү?",
          "structure": {"part1": "Is", "part2": "he", "part3": "teacher"}
        },
        {
          "label": "negative",
          "eng": "He is not a teacher",
          "mon": "Тэр эрэгтэй бол багш биш",
          "structure": {
            "part1": "He",
            "part2": "is",
            "part3": "not",
            "part4": "teacher"
          }
        },
        {
          "label": "positive",
          "eng": "He is a student",
          "mon": "Тэр эрэгтэй бол оюутан",
          "structure": {"part1": "She", "part2": "are", "part3": "student"}
        },
        {
          "label": "question",
          "eng": "Is he a student?",
          "mon": "Тэр эрэгтэй оюутан мөн үү?",
          "structure": {"part1": "Is", "part2": "he", "part3": "student"}
        },
        {
          "label": "negative",
          "eng": "He is not a student",
          "mon": "Тэр эрэгтэй бол оюутан биш",
          "structure": {
            "part1": "He",
            "part2": "is",
            "part3": "not",
            "part4": "student"
          }
        },
        {
          "label": "positive",
          "eng": "It is a dog",
          "mon": "Энэ бол нохой",
          "structure": {"part1": "It", "part2": "is", "part3": "dog"},
        },
        {
          "label": "question",
          "eng": "Is it a dog?",
          "mon": "Энэ нохой мөн үү?",
          "structure": {"part1": "Is", "part2": "it", "part3": "dog"},
        },
        {
          "label": "negative",
          "eng": "It is not a dog",
          "mon": "Энэ нохой биш",
          "structure": {
            "part1": "It",
            "part2": "is",
            "part3": "not",
            "part4": "dog"
          }
        },
      ]
    };
    return UnitGrammar.fromJson(grammarData);
    //   try {
    //   final response = await dioRepository.instance.get('Word/$encoded');
    //   final res = json.decode('$response');
    //     if (res['isSuccess']) {
    //       return CueWord.fromJson(res);
    //     } else {
    //       dioRepository.snackBar(res['resultMessage']);
    //       return null;
    //     }
    //   } catch (e) {
    //     print(e.toString().toUpperCase());
    //     dioRepository.snackBar(e.toString().toUpperCase());
    //     return null;
    //   }
  }
}
