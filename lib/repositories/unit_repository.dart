import 'dart:convert';
import 'package:medlegten/models/Landing/unit_complete_percent.dart';
import 'package:medlegten/models/Unit/cue_word.dart';
import 'package:medlegten/models/Unit/reading.dart';
import 'package:medlegten/models/Unit/unit_conversation_video.dart';
import 'package:medlegten/models/Unit/unit_grammar.dart';
import 'package:medlegten/models/Unit/unit_introduction_video.dart';
import 'package:medlegten/models/Unit/unit_listening_quiz_question.dart';
import 'package:medlegten/models/Unit/unit_mixed_video.dart';
import 'package:medlegten/models/Unit/unit_vocabulary.dart';
import 'package:medlegten/models/Unit/unit_vocabulary_word.dart';
import 'package:medlegten/models/Unit/unit_writing.dart';
import 'package:medlegten/repositories/repository.dart';
import 'package:medlegten/services/custom_exception.dart';
import 'package:medlegten/services/http_helper.dart';
import 'package:medlegten/widgets/snackbar/custom_snackbar.dart';

class UnitRepository {
  ///course or unit complete
  Future<UnitCompleteInfo> getUnitCompletePercent(
      {String? id, String? mode}) async {
    try {
      print(id);
      final res = await HttpHelper().getUrl(url: 'Course/Precent/$id/$mode');
      if (res['isSuccess']) {
        return UnitCompleteInfo.fromJson(res);
      } else {
        print(res['resultMessage']);
        dioRepository.snackBar(res['resultMessage']);
        throw CustomException(errorMsg: res['resultMessage']);
      }
    } catch (e) {
      print(e.toString());
      dioRepository.snackBar(e.toString().toUpperCase());
      throw CustomException(errorMsg: e.toString().toUpperCase());
    }
  }

  Future<ListeningQuiz?> getUnitListening(
      {String? moduleId, String? moduleTypeid}) async {
    try {
      final res = await HttpHelper()
          .getUrl(url: 'Course/UnitModule/$moduleId/$moduleTypeid');
      if (res['isSuccess']) {
        return ListeningQuiz.fromJson(res);
      } else {
        dioRepository.snackBar(res['resultMessage']);
        throw CustomException(errorMsg: res['resultMessage']);
      }
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
      throw CustomException(errorMsg: e.toString().toUpperCase());
    }
  }

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

  Future<UnitConversationVideo?> getConversationVideo(String moduleId) async {
    try {
      final res =
          await HttpHelper().getUrl(url: 'Course/UnitModule/$moduleId/7');
      if (res['isSuccess']) {
        return UnitConversationVideo.fromJson(res['conversation']);
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

  Future<UnitWriting?> getWriting(String moduleId) async {
    try {
      final res =
          await HttpHelper().getUrl(url: 'Course/UnitModule/$moduleId/6');
      if (res['isSuccess']) {
        return UnitWriting.fromJson(res['writing']);
      } else {
        dioRepository.snackBar(res['resultMessage']);
        return null;
      }
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
      return null;
    }
  }
}
