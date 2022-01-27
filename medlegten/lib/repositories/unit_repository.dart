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

  Future<UnitGrammar?> getUnitGrammar(String moduleId) async {
    var grammarData = {
      "grammar": [
        {
          "grammarNameEng": "To be and pronoun",
          "grammarNameMon": "Tobe mongol",
          "label": "positive",
          "avatar": "",
          "avatarHostSource": "",
          "part1": "",
          "part2": "",
          "part3": "",
          "part4": "",
          "part5": "",
          "part6": "",
          "structure": [
            {
              "part": "part1",
              "nameEng": "Subject",
              "nameMon": "Өгүүлэгдэхүүн",
              "nameShort": "S"
            },
            {
              "part": "part2",
              "nameEng": "Tobe",
              "nameMon": "Байх",
              "nameShort": "Tobe"
            },
            {
              "part": "part3",
              "nameEng": "Object",
              "nameMon": "Тусагдахуун",
              "nameShort": "Obj"
            }
          ]
        },
        {
          "grammarNameEng": "To be and pronoun",
          "grammarNameMon": "Tobe mongol",
          "label": "question",
          "avatar": "",
          "avatarHostSource": "",
          "part1": "",
          "part2": "",
          "part3": "",
          "part4": "",
          "part5": "",
          "part6": "",
          "structure": [
            {
              "part": "part1",
              "nameEng": "Tobe",
              "nameMon": "Байх",
              "nameShort": "Tobe"
            },
            {
              "part": "part2",
              "nameEng": "Subject",
              "nameMon": "Өгүүлэгдэхүүн",
              "nameShort": "S"
            },
            {
              "part": "part3",
              "nameEng": "Object",
              "nameMon": "Тусагдахуун",
              "nameShort": "Obj"
            }
          ]
        },
        {
          "grammarNameEng": "To be and pronoun",
          "grammarNameMon": "Tobe mongol",
          "label": "negative",
          "avatar": "",
          "avatarHostSource": "",
          "part1": "",
          "part2": "",
          "part3": "",
          "part4": "",
          "part5": "",
          "part6": "",
          "structure": [
            {
              "part": "part1",
              "nameEng": "Subject",
              "nameMon": "Өгүүлэгдэхүүн",
              "nameShort": "S"
            },
            {
              "part": "part2",
              "nameEng": "Tobe",
              "nameMon": "Байх",
              "nameShort": "Tobe"
            },
            {
              "part": "part3",
              "nameEng": "Adverb",
              "nameMon": "Дайвар үг",
              "nameShort": "Adv"
            },
            {
              "part": "part4",
              "nameEng": "Object",
              "nameMon": "Тусагдахуун",
              "nameShort": "Obj"
            }
          ]
        }
      ],
      "sentences": [
        {
          "group": "1",
          "grammarLabel": "positive",
          "textEng": "I am a student",
          "textMon": "Би бол оюутан",
          "structure": [
            {
              "part": "part1",
              "word": "I",
              "nameEng": "Subject",
              "nameMon": "Өгүүлэгдэхүүн",
              "nameShort": "S"
            },
            {
              "part": "part2",
              "word": "am",
              "nameEng": "Tobe",
              "nameMon": "Байх",
              "nameShort": "Tobe"
            },
            {
              "part": "part3",
              "word": "student",
              "nameEng": "Object",
              "nameMon": "Тусагдахуун",
              "nameShort": "Obj"
            }
          ]
        },
        {
          "group": "2",
          "grammarLabel": "positive",
          "textEng": "I am a teacher",
          "textMon": "Би бол багш",
          "structure": [
            {
              "part": "part1",
              "word": "I",
              "nameEng": "Subject",
              "nameMon": "Өгүүлэгдэхүүн",
              "nameShort": "S"
            },
            {
              "part": "part2",
              "word": "am",
              "nameEng": "Tobe",
              "nameMon": "Байх",
              "nameShort": "Tobe"
            },
            {
              "part": "part3",
              "word": "teacher",
              "nameEng": "Object",
              "nameMon": "Тусагдахуун",
              "nameShort": "Obj"
            }
          ]
        },
        {
          "group": "3",
          "grammarLabel": "positive",
          "textEng": "He is a student",
          "textMon": "Тэр эрэгтэй бол оюутан",
          "structure": [
            {
              "part": "part1",
              "word": "He",
              "nameEng": "Subject",
              "nameMon": "Өгүүлэгдэхүүн",
              "nameShort": "S"
            },
            {
              "part": "part2",
              "word": "is",
              "nameEng": "Tobe",
              "nameMon": "Байх",
              "nameShort": "Tobe"
            },
            {
              "part": "part3",
              "word": "student",
              "nameEng": "Object",
              "nameMon": "Тусагдахуун",
              "nameShort": "Obj"
            }
          ]
        },
        {
          "group": "4",
          "grammarLabel": "positive",
          "textEng": "He is a teacher",
          "textMon": "Тэр эрэгтэй бол багш",
          "structure": [
            {
              "part": "part1",
              "word": "He",
              "nameEng": "Subject",
              "nameMon": "Өгүүлэгдэхүүн",
              "nameShort": "S"
            },
            {
              "part": "part2",
              "word": "is",
              "nameEng": "Tobe",
              "nameMon": "Байх",
              "nameShort": "Tobe"
            },
            {
              "part": "part3",
              "word": "teacher",
              "nameEng": "Object",
              "nameMon": "Тусагдахуун",
              "nameShort": "Obj"
            }
          ]
        },
        {
          "group": "5",
          "grammarLabel": "positive",
          "textEng": "She is a student",
          "textMon": "Тэр эмэгтэй бол оюутан",
          "structure": [
            {
              "part": "part1",
              "word": "She",
              "nameEng": "Subject",
              "nameMon": "Өгүүлэгдэхүүн",
              "nameShort": "S"
            },
            {
              "part": "part2",
              "word": "is",
              "nameEng": "Tobe",
              "nameMon": "Байх",
              "nameShort": "Tobe"
            },
            {
              "part": "part3",
              "word": "student",
              "nameEng": "Object",
              "nameMon": "Тусагдахуун",
              "nameShort": "Obj"
            }
          ]
        },
        {
          "group": "6",
          "grammarLabel": "positive",
          "textEng": "She is a teacher",
          "textMon": "Тэр эмэгтэй бол багш",
          "structure": [
            {
              "part": "part1",
              "word": "She",
              "nameEng": "Subject",
              "nameMon": "Өгүүлэгдэхүүн",
              "nameShort": "S"
            },
            {
              "part": "part2",
              "word": "is",
              "nameEng": "Tobe",
              "nameMon": "Байх",
              "nameShort": "Tobe"
            },
            {
              "part": "part3",
              "word": "teacher",
              "nameEng": "Object",
              "nameMon": "Тусагдахуун",
              "nameShort": "Obj"
            }
          ]
        },
        {
          "group": "7",
          "grammarLabel": "positive",
          "textEng": "It is a dog",
          "textMon": "Энэ бол нохой",
          "structure": [
            {
              "part": "part1",
              "word": "It",
              "nameEng": "Subject",
              "nameMon": "Өгүүлэгдэхүүн",
              "nameShort": "S"
            },
            {
              "part": "part2",
              "word": "is",
              "nameEng": "Tobe",
              "nameMon": "Байх",
              "nameShort": "Tobe"
            },
            {
              "part": "part3",
              "word": "dog",
              "nameEng": "Object",
              "nameMon": "Тусагдахуун",
              "nameShort": "Obj"
            }
          ]
        },
        {
          "group": "8",
          "grammarLabel": "positive",
          "textEng": "It is a cat",
          "textMon": "Энэ бол муур",
          "structure": [
            {
              "part": "part1",
              "word": "It",
              "nameEng": "Subject",
              "nameMon": "Өгүүлэгдэхүүн",
              "nameShort": "S"
            },
            {
              "part": "part2",
              "word": "is",
              "nameEng": "Tobe",
              "nameMon": "Байх",
              "nameShort": "Tobe"
            },
            {
              "part": "part3",
              "word": "cat",
              "nameEng": "Object",
              "nameMon": "Тусагдахуун",
              "nameShort": "Obj"
            }
          ]
        },
        {
          "group": "9",
          "grammarLabel": "positive",
          "textEng": "We are students",
          "textMon": "Бид нар бол оюутнууд",
          "structure": [
            {
              "part": "part1",
              "word": "We",
              "nameEng": "Subject",
              "nameMon": "Өгүүлэгдэхүүн",
              "nameShort": "S"
            },
            {
              "part": "part2",
              "word": "are",
              "nameEng": "Tobe",
              "nameMon": "Байх",
              "nameShort": "Tobe"
            },
            {
              "part": "part3",
              "word": "students",
              "nameEng": "Object",
              "nameMon": "Тусагдахуун",
              "nameShort": "Obj"
            }
          ]
        },
        {
          "group": "10",
          "grammarLabel": "positive",
          "textEng": "We are teachers",
          "textMon": "Бид нар бол багш нар",
          "structure": [
            {
              "part": "part1",
              "word": "We",
              "nameEng": "Subject",
              "nameMon": "Өгүүлэгдэхүүн",
              "nameShort": "S"
            },
            {
              "part": "part2",
              "word": "are",
              "nameEng": "Tobe",
              "nameMon": "Байх",
              "nameShort": "Tobe"
            },
            {
              "part": "part3",
              "word": "teachers",
              "nameEng": "Object",
              "nameMon": "Тусагдахуун",
              "nameShort": "Obj"
            }
          ]
        },
        {
          "group": "11",
          "grammarLabel": "positive",
          "textEng": "They are students",
          "textMon": "Тэд нар бол оюутнууд",
          "structure": [
            {
              "part": "part1",
              "word": "They",
              "nameEng": "Subject",
              "nameMon": "Өгүүлэгдэхүүн",
              "nameShort": "S"
            },
            {
              "part": "part2",
              "word": "are",
              "nameEng": "Tobe",
              "nameMon": "Байх",
              "nameShort": "Tobe"
            },
            {
              "part": "part3",
              "word": "students",
              "nameEng": "Object",
              "nameMon": "Тусагдахуун",
              "nameShort": "Obj"
            }
          ]
        },
        {
          "group": "12",
          "grammarLabel": "positive",
          "textEng": "They are teachers",
          "textMon": "Тэд нар бол багш нар",
          "structure": [
            {
              "part": "part1",
              "word": "They",
              "nameEng": "Subject",
              "nameMon": "Өгүүлэгдэхүүн",
              "nameShort": "S"
            },
            {
              "part": "part2",
              "word": "are",
              "nameEng": "Tobe",
              "nameMon": "Байх",
              "nameShort": "Tobe"
            },
            {
              "part": "part3",
              "word": "teachers",
              "nameEng": "Object",
              "nameMon": "Тусагдахуун",
              "nameShort": "Obj"
            }
          ]
        },
        {
          "group": "1",
          "grammarLabel": "question",
          "textEng": "Am I a student ?",
          "textMon": "Би сурагч уу ?",
          "structure": [
            {
              "part": "part1",
              "word": "Am",
              "nameEng": "Tobe",
              "nameMon": "Байх",
              "nameShort": "Tobe"
            },
            {
              "part": "part2",
              "word": "I",
              "nameEng": "Subject",
              "nameMon": "Өгүүлэгдэхүүн",
              "nameShort": "S"
            },
            {
              "part": "part3",
              "word": "student",
              "nameEng": "Object",
              "nameMon": "Тусагдахуун",
              "nameShort": "Obj"
            }
          ]
        },
        {
          "group": "2",
          "grammarLabel": "question",
          "textEng": "Am I a teacher ?",
          "textMon": "Би багш уу ?",
          "structure": [
            {
              "part": "part1",
              "word": "Am",
              "nameEng": "Tobe",
              "nameMon": "Байх",
              "nameShort": "Tobe"
            },
            {
              "part": "part2",
              "word": "I",
              "nameEng": "Subject",
              "nameMon": "Өгүүлэгдэхүүн",
              "nameShort": "S"
            },
            {
              "part": "part3",
              "word": "teacher",
              "nameEng": "Object",
              "nameMon": "Тусагдахуун",
              "nameShort": "Obj"
            }
          ]
        },
        {
          "group": "3",
          "grammarLabel": "question",
          "textEng": "Is he a student ?",
          "textMon": "Тэр эрэгтэй сурагч уу ?",
          "structure": [
            {
              "part": "part1",
              "word": "Is",
              "nameEng": "Tobe",
              "nameMon": "Байх",
              "nameShort": "Tobe"
            },
            {
              "part": "part2",
              "word": "he",
              "nameEng": "Subject",
              "nameMon": "Өгүүлэгдэхүүн",
              "nameShort": "S"
            },
            {
              "part": "part3",
              "word": "student",
              "nameEng": "Object",
              "nameMon": "Тусагдахуун",
              "nameShort": "Obj"
            }
          ]
        },
        {
          "group": "4",
          "grammarLabel": "question",
          "textEng": "Is he a teacher ?",
          "textMon": "Тэр эрэгтэй багш уу ?",
          "structure": [
            {
              "part": "part1",
              "word": "Is",
              "nameEng": "Tobe",
              "nameMon": "Байх",
              "nameShort": "Tobe"
            },
            {
              "part": "part2",
              "word": "he",
              "nameEng": "Subject",
              "nameMon": "Өгүүлэгдэхүүн",
              "nameShort": "S"
            },
            {
              "part": "part3",
              "word": "teacher",
              "nameEng": "Object",
              "nameMon": "Тусагдахуун",
              "nameShort": "Obj"
            }
          ]
        },
        {
          "group": "5",
          "grammarLabel": "question",
          "textEng": "Is she a student ?",
          "textMon": "Тэр эмэгтэй сурагч уу ?",
          "structure": [
            {
              "part": "part1",
              "word": "Is",
              "nameEng": "Tobe",
              "nameMon": "Байх",
              "nameShort": "Tobe"
            },
            {
              "part": "part2",
              "word": "she",
              "nameEng": "Subject",
              "nameMon": "Өгүүлэгдэхүүн",
              "nameShort": "S"
            },
            {
              "part": "part3",
              "word": "student",
              "nameEng": "Object",
              "nameMon": "Тусагдахуун",
              "nameShort": "Obj"
            }
          ]
        },
        {
          "group": "6",
          "grammarLabel": "question",
          "textEng": "Is she a teacher ?",
          "textMon": "Тэр эмэгтэй багш уу ?",
          "structure": [
            {
              "part": "part1",
              "word": "Is",
              "nameEng": "Tobe",
              "nameMon": "Байх",
              "nameShort": "Tobe"
            },
            {
              "part": "part2",
              "word": "she",
              "nameEng": "Subject",
              "nameMon": "Өгүүлэгдэхүүн",
              "nameShort": "S"
            },
            {
              "part": "part3",
              "word": "teacher",
              "nameEng": "Object",
              "nameMon": "Тусагдахуун",
              "nameShort": "Obj"
            }
          ]
        },
        {
          "group": "7",
          "grammarLabel": "question",
          "textEng": "Is it a dog ?",
          "textMon": "Энэ нохой юу ?",
          "structure": [
            {
              "part": "part1",
              "word": "Is",
              "nameEng": "Tobe",
              "nameMon": "Байх",
              "nameShort": "Tobe"
            },
            {
              "part": "part2",
              "word": "it",
              "nameEng": "Subject",
              "nameMon": "Өгүүлэгдэхүүн",
              "nameShort": "S"
            },
            {
              "part": "part3",
              "word": "dog",
              "nameEng": "Object",
              "nameMon": "Тусагдахуун",
              "nameShort": "Obj"
            }
          ]
        },
        {
          "group": "8",
          "grammarLabel": "question",
          "textEng": "Is it a cat ?",
          "textMon": "Энэ муур уу ?",
          "structure": [
            {
              "part": "part1",
              "word": "Is",
              "nameEng": "Tobe",
              "nameMon": "Байх",
              "nameShort": "Tobe"
            },
            {
              "part": "part2",
              "word": "it",
              "nameEng": "Subject",
              "nameMon": "Өгүүлэгдэхүүн",
              "nameShort": "S"
            },
            {
              "part": "part3",
              "word": "cat",
              "nameEng": "Object",
              "nameMon": "Тусагдахуун",
              "nameShort": "Obj"
            }
          ]
        },
        {
          "group": "9",
          "grammarLabel": "question",
          "textEng": "Are we students ?",
          "textMon": "Бид сурагчид уу ?",
          "structure": [
            {
              "part": "part1",
              "word": "Are",
              "nameEng": "Tobe",
              "nameMon": "Байх",
              "nameShort": "Tobe"
            },
            {
              "part": "part2",
              "word": "we",
              "nameEng": "Subject",
              "nameMon": "Өгүүлэгдэхүүн",
              "nameShort": "S"
            },
            {
              "part": "part3",
              "word": "students",
              "nameEng": "Object",
              "nameMon": "Тусагдахуун",
              "nameShort": "Obj"
            }
          ]
        },
        {
          "group": "10",
          "grammarLabel": "question",
          "textEng": "Are we teachers ?",
          "textMon": "Бид багш нар уу ?",
          "structure": [
            {
              "part": "part1",
              "word": "Are",
              "nameEng": "Tobe",
              "nameMon": "Байх",
              "nameShort": "Tobe"
            },
            {
              "part": "part2",
              "word": "we",
              "nameEng": "Subject",
              "nameMon": "Өгүүлэгдэхүүн",
              "nameShort": "S"
            },
            {
              "part": "part3",
              "word": "teachers",
              "nameEng": "Object",
              "nameMon": "Тусагдахуун",
              "nameShort": "Obj"
            }
          ]
        },
        {
          "group": "11",
          "grammarLabel": "question",
          "textEng": "Are they students ?",
          "textMon": "Тэд нар сурагчид уу ?",
          "structure": [
            {
              "part": "part1",
              "word": "Are",
              "nameEng": "Tobe",
              "nameMon": "Байх",
              "nameShort": "Tobe"
            },
            {
              "part": "part2",
              "word": "they",
              "nameEng": "Subject",
              "nameMon": "Өгүүлэгдэхүүн",
              "nameShort": "S"
            },
            {
              "part": "part3",
              "word": "students",
              "nameEng": "Object",
              "nameMon": "Тусагдахуун",
              "nameShort": "Obj"
            }
          ]
        },
        {
          "group": "12",
          "grammarLabel": "question",
          "textEng": "Are they teachers ?",
          "textMon": "Тэд нар багш нар уу ?",
          "structure": [
            {
              "part": "part1",
              "word": "Are",
              "nameEng": "Tobe",
              "nameMon": "Байх",
              "nameShort": "Tobe"
            },
            {
              "part": "part2",
              "word": "they",
              "nameEng": "Subject",
              "nameMon": "Өгүүлэгдэхүүн",
              "nameShort": "S"
            },
            {
              "part": "part3",
              "word": "teachers",
              "nameEng": "Object",
              "nameMon": "Тусагдахуун",
              "nameShort": "Obj"
            }
          ]
        },
        {
          "group": "1",
          "grammarLabel": "negative",
          "textEng": "I am not a student",
          "textMon": "Би сурагч биш",
          "structure": [
            {
              "part": "part1",
              "word": "I",
              "nameEng": "Subject",
              "nameMon": "Өгүүлэгдэхүүн",
              "nameShort": "S"
            },
            {
              "part": "part2",
              "word": "am",
              "nameEng": "Tobe",
              "nameMon": "Байх",
              "nameShort": "Tobe"
            },
            {
              "part": "part3",
              "word": "not",
              "nameEng": "Adverb",
              "nameMon": "Дайвар үг",
              "nameShort": "Adv"
            },
            {
              "part": "part4",
              "word": "student",
              "nameEng": "Object",
              "nameMon": "Тусагдахуун",
              "nameShort": "Obj"
            }
          ]
        },
        {
          "group": "2",
          "grammarLabel": "negative",
          "textEng": "I am not a teacher",
          "textMon": "Би багш биш",
          "structure": [
            {
              "part": "part1",
              "word": "I",
              "nameEng": "Subject",
              "nameMon": "Өгүүлэгдэхүүн",
              "nameShort": "S"
            },
            {
              "part": "part2",
              "word": "am",
              "nameEng": "Tobe",
              "nameMon": "Байх",
              "nameShort": "Tobe"
            },
            {
              "part": "part3",
              "word": "not",
              "nameEng": "Adverb",
              "nameMon": "Дайвар үг",
              "nameShort": "Adv"
            },
            {
              "part": "part4",
              "word": "teacher",
              "nameEng": "Object",
              "nameMon": "Тусагдахуун",
              "nameShort": "Obj"
            }
          ]
        },
        {
          "group": "3",
          "grammarLabel": "negative",
          "textEng": "He is not a student",
          "textMon": "Тэр эрэгтэй сурагч биш",
          "structure": [
            {
              "part": "part1",
              "word": "He",
              "nameEng": "Subject",
              "nameMon": "Өгүүлэгдэхүүн",
              "nameShort": "S"
            },
            {
              "part": "part2",
              "word": "is",
              "nameEng": "Tobe",
              "nameMon": "Байх",
              "nameShort": "Tobe"
            },
            {
              "part": "part3",
              "word": "not",
              "nameEng": "Adverb",
              "nameMon": "Дайвар үг",
              "nameShort": "Adv"
            },
            {
              "part": "part4",
              "word": "student",
              "nameEng": "Object",
              "nameMon": "Тусагдахуун",
              "nameShort": "Obj"
            }
          ]
        },
        {
          "group": "4",
          "grammarLabel": "negative",
          "textEng": "He is not a teacher",
          "textMon": "Тэр эрэгтэй багш биш",
          "structure": [
            {
              "part": "part1",
              "word": "He",
              "nameEng": "Subject",
              "nameMon": "Өгүүлэгдэхүүн",
              "nameShort": "S"
            },
            {
              "part": "part2",
              "word": "is",
              "nameEng": "Tobe",
              "nameMon": "Байх",
              "nameShort": "Tobe"
            },
            {
              "part": "part3",
              "word": "not",
              "nameEng": "Adverb",
              "nameMon": "Дайвар үг",
              "nameShort": "Adv"
            },
            {
              "part": "part4",
              "word": "teacher",
              "nameEng": "Object",
              "nameMon": "Тусагдахуун",
              "nameShort": "Obj"
            }
          ]
        },
        {
          "group": "5",
          "grammarLabel": "negative",
          "textEng": "She is not a student",
          "textMon": "Тэр эмэгтэй сурагч биш",
          "structure": [
            {
              "part": "part1",
              "word": "She",
              "nameEng": "Subject",
              "nameMon": "Өгүүлэгдэхүүн",
              "nameShort": "S"
            },
            {
              "part": "part2",
              "word": "is",
              "nameEng": "Tobe",
              "nameMon": "Байх",
              "nameShort": "Tobe"
            },
            {
              "part": "part3",
              "word": "not",
              "nameEng": "Adverb",
              "nameMon": "Дайвар үг",
              "nameShort": "Adv"
            },
            {
              "part": "part4",
              "word": "student",
              "nameEng": "Object",
              "nameMon": "Тусагдахуун",
              "nameShort": "Obj"
            }
          ]
        },
        {
          "group": "6",
          "grammarLabel": "negative",
          "textEng": "She is not a teacher",
          "textMon": "Тэр эмэгтэй багш биш",
          "structure": [
            {
              "part": "part1",
              "word": "She",
              "nameEng": "Subject",
              "nameMon": "Өгүүлэгдэхүүн",
              "nameShort": "S"
            },
            {
              "part": "part2",
              "word": "is",
              "nameEng": "Tobe",
              "nameMon": "Байх",
              "nameShort": "Tobe"
            },
            {
              "part": "part3",
              "word": "not",
              "nameEng": "Adverb",
              "nameMon": "Дайвар үг",
              "nameShort": "Adv"
            },
            {
              "part": "part4",
              "word": "teacher",
              "nameEng": "Object",
              "nameMon": "Тусагдахуун",
              "nameShort": "Obj"
            }
          ]
        },
        {
          "group": "7",
          "grammarLabel": "negative",
          "textEng": "It is not a dog",
          "textMon": "Энэ нохой биш",
          "structure": [
            {
              "part": "part1",
              "word": "It",
              "nameEng": "Subject",
              "nameMon": "Өгүүлэгдэхүүн",
              "nameShort": "S"
            },
            {
              "part": "part2",
              "word": "is",
              "nameEng": "Tobe",
              "nameMon": "Байх",
              "nameShort": "Tobe"
            },
            {
              "part": "part3",
              "word": "not",
              "nameEng": "Adverb",
              "nameMon": "Дайвар үг",
              "nameShort": "Adv"
            },
            {
              "part": "part4",
              "word": "dog",
              "nameEng": "Object",
              "nameMon": "Тусагдахуун",
              "nameShort": "Obj"
            }
          ]
        },
        {
          "group": "8",
          "grammarLabel": "negative",
          "textEng": "It is not a cat",
          "textMon": "Энэ муур биш",
          "structure": [
            {
              "part": "part1",
              "word": "It",
              "nameEng": "Subject",
              "nameMon": "Өгүүлэгдэхүүн",
              "nameShort": "S"
            },
            {
              "part": "part2",
              "word": "is",
              "nameEng": "Tobe",
              "nameMon": "Байх",
              "nameShort": "Tobe"
            },
            {
              "part": "part3",
              "word": "not",
              "nameEng": "Adverb",
              "nameMon": "Дайвар үг",
              "nameShort": "Adv"
            },
            {
              "part": "part4",
              "word": "cat",
              "nameEng": "Object",
              "nameMon": "Тусагдахуун",
              "nameShort": "Obj"
            }
          ]
        },
        {
          "group": "9",
          "grammarLabel": "negative",
          "textEng": "We are not students",
          "textMon": "Бид сурагчид биш",
          "structure": [
            {
              "part": "part1",
              "word": "We",
              "nameEng": "Subject",
              "nameMon": "Өгүүлэгдэхүүн",
              "nameShort": "S"
            },
            {
              "part": "part2",
              "word": "are",
              "nameEng": "Tobe",
              "nameMon": "Байх",
              "nameShort": "Tobe"
            },
            {
              "part": "part3",
              "word": "not",
              "nameEng": "Adverb",
              "nameMon": "Дайвар үг",
              "nameShort": "Adv"
            },
            {
              "part": "part4",
              "word": "students",
              "nameEng": "Object",
              "nameMon": "Тусагдахуун",
              "nameShort": "Obj"
            }
          ]
        },
        {
          "group": "10",
          "grammarLabel": "negative",
          "textEng": "We are not teachers",
          "textMon": "Бид багш нар биш",
          "structure": [
            {
              "part": "part1",
              "word": "We",
              "nameEng": "Subject",
              "nameMon": "Өгүүлэгдэхүүн",
              "nameShort": "S"
            },
            {
              "part": "part2",
              "word": "are",
              "nameEng": "Tobe",
              "nameMon": "Байх",
              "nameShort": "Tobe"
            },
            {
              "part": "part3",
              "word": "not",
              "nameEng": "Adverb",
              "nameMon": "Дайвар үг",
              "nameShort": "Adv"
            },
            {
              "part": "part4",
              "word": "teachers",
              "nameEng": "Object",
              "nameMon": "Тусагдахуун",
              "nameShort": "Obj"
            }
          ]
        },
        {
          "group": "11",
          "grammarLabel": "negative",
          "textEng": "They are not students",
          "textMon": "Тэд нар сурагчид биш",
          "structure": [
            {
              "part": "part1",
              "word": "They",
              "nameEng": "Subject",
              "nameMon": "Өгүүлэгдэхүүн",
              "nameShort": "S"
            },
            {
              "part": "part2",
              "word": "are",
              "nameEng": "Tobe",
              "nameMon": "Байх",
              "nameShort": "Tobe"
            },
            {
              "part": "part3",
              "word": "not",
              "nameEng": "Adverb",
              "nameMon": "Дайвар үг",
              "nameShort": "Adv"
            },
            {
              "part": "part4",
              "word": "students",
              "nameEng": "Object",
              "nameMon": "Тусагдахуун",
              "nameShort": "Obj"
            }
          ]
        },
        {
          "group": "12",
          "grammarLabel": "negative",
          "textEng": "They are not teachers",
          "textMon": "Тэд нар багш нар биш",
          "structure": [
            {
              "part": "part1",
              "word": "They",
              "nameEng": "Subject",
              "nameMon": "Өгүүлэгдэхүүн",
              "nameShort": "S"
            },
            {
              "part": "part2",
              "word": "are",
              "nameEng": "Tobe",
              "nameMon": "Байх",
              "nameShort": "Tobe"
            },
            {
              "part": "part3",
              "word": "not",
              "nameEng": "Adverb",
              "nameMon": "Дайвар үг",
              "nameShort": "Adv"
            },
            {
              "part": "part4",
              "word": "teachers",
              "nameEng": "Object",
              "nameMon": "Тусагдахуун",
              "nameShort": "Obj"
            }
          ]
        }
      ]
    };
    return UnitGrammar.fromJson(grammarData);
    // try {
    //   final response =
    //       await dioRepository.instance.get('Course/UnitModule/$moduleId/2');
    //   final res = json.decode('$response');
    //   if (res['isSuccess']) {
    //     return UnitGrammar.fromJson(res['grammarTable']);
    //   } else {
    //     dioRepository.snackBar(res['resultMessage']);
    //     return null;
    //   }
    // } catch (e) {
    //   print(e.toString().toUpperCase());
    //   dioRepository.snackBar(e.toString().toUpperCase());
    //   return null;
    // }
  }
}
