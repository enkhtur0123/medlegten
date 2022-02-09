import 'dart:convert';
import 'package:medlegten/models/Unit/cue_word.dart';
import 'package:medlegten/models/Unit/reading.dart';
import 'package:medlegten/models/Unit/unit_grammar.dart';
import 'package:medlegten/models/Unit/unit_introduction_video.dart';
import 'package:medlegten/models/Unit/unit_mixed_video.dart';
import 'package:medlegten/models/Unit/unit_vocabulary.dart';
import 'package:medlegten/models/Unit/unit_vocabulary_word.dart';
import 'package:medlegten/repositories/repository.dart';
import 'package:medlegten/services/custom_exception.dart';
import 'package:medlegten/services/http_helper.dart';
import 'package:medlegten/widgets/snackbar/custom_snackbar.dart';

class UnitRepository {
  //moduleTypeId =
  Future<UnitIntroVideo?> getUnitIntroVideo(String moduleId) async {
    try {
      final res =
          await HttpHelper().getUrl(url: 'Course/UnitModule/$moduleId/1');
      if (res['isSuccess']) {
        return UnitIntroVideo.fromJson(res['introVideo']);
      } else {
        MySnackBar(text: res['resultMessage']);
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
      final res = await HttpHelper().getUrl(url: 'Word/$encoded');
      if (res['isSuccess']) {
        return CueWord.fromJson(res);
      } else {
        //dioRepository.snackBar(res['resultMessage']);
        return null;
      }
    } catch (e) {
      print(e.toString().toUpperCase());
      dioRepository.snackBar(e.toString().toUpperCase());
      return null;
    }
  }

  Future<UnitIntroVideo?> getConversationVideo(String moduleId) async {
    try {
      final res =
          await HttpHelper().getUrl(url: 'Course/UnitModule/$moduleId/1');
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

  Future<UnitMixedVideo?> getMixedVideo(String moduleId) async {
    try {
      final res =
          await HttpHelper().getUrl(url: 'Course/UnitModule/$moduleId/3');
      if (res['isSuccess']) {
        return UnitMixedVideo.fromJson(res['mixedVideo']);
      } else {
        dioRepository.snackBar(res['resultMessage']);
        return null;
      }
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
      return null;
    }
  }

  Future<Reading?> getReading(String moduleId) async {
    try {
      final res =
          await HttpHelper().getUrl(url: 'Course/UnitModule/$moduleId/4');
      if (res['isSuccess']) {
        return Reading.fromJson(res['reading']);
      } else {
        dioRepository.snackBar(res['resultMessage']);
        return null;
      }
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
      return null;
    }
  }

  Future<String> setBookMark(String wordId, int set) async {
    try {
      var res = await HttpHelper().getUrl(url: 'Word/bookmark/$wordId/$set');
      if (res['isSuccess']) {
        return 'Success';
      } else {
        return res['resultMessage'];
      }
    } catch (ex) {
      throw CustomException(errorMsg: ex.toString());
    }
  }

  Future<UnitVocabulary?> getUnitVocabulary(
      String unitId, int pageNumber, int pageSize, int type) async {
    try {
      final res = await HttpHelper().getUrl(
          url:
              'Course/Vocabulary/$unitId/$type?pageNumber=$pageNumber&pageSize=$pageSize');
      if (res['isSuccess']) {
        var list = res['words'] as List;
        var words = list.map((i) => UnitVocabularyWord.fromJson(i)).toList();
        return UnitVocabulary(res['wordCount'], words);
      } else {
        dioRepository.snackBar(res['resultMessage']);
        return null;
      }
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
      return null;
    }
  }

  Future<UnitGrammar?> getUnitGrammar(String moduleId) async {
    try {
      final res =
          await HttpHelper().getUrl(url: 'Course/UnitModule/$moduleId/2');
      if (res['isSuccess']) {
        return UnitGrammar.fromJson(res['grammarTable']);
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
}
