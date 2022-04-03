import 'package:medlegten/models/video/category.dart';
import 'package:medlegten/models/video/event.dart';
import 'package:medlegten/models/video/level_event.dart';
import 'package:medlegten/models/video/movie.dart';
import 'package:medlegten/models/video/payment_info.dart';
import 'package:medlegten/models/video/video_cue.dart';
import 'package:medlegten/models/video/video_vocabulary.dart';
import 'package:medlegten/models/video/video_vocabulary_word.dart';
import 'package:medlegten/repositories/repository.dart';
import 'package:medlegten/services/custom_exception.dart';
import 'package:medlegten/services/http_helper.dart';

class VideoRepository {
  Future<List<Event>> categorySearch(
      {String? categoryId, int? pageNumber, int? pageSize}) async {
    try {
      final res = await HttpHelper().getUrl(
          url:
              '/ppv/CategoryAll/$categoryId?pageNumber=$pageNumber&pageSize=$pageSize');
      if (res['isSuccess']) {
        if (res['events'] == null) {
          return [];
        } else {
          var list = res['events'] as List;
          return list.map((i) => Event.fromJson(i)).toList();
        }
      } else {
        dioRepository.snackBar(res['resultMessage']);
        throw CustomException(errorMsg: res['resultMessage']);
      }
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
      throw CustomException(errorMsg: e.toString().toUpperCase());
    }
  }

  Future<dynamic> getCategory({String? type = "0"}) async {
    try {
      final res = await HttpHelper().getUrl(url: 'ppv/Category/$type');
      if (res['isSuccess']) {
        var list = res['categories'] as List;
        return list.map((i) => Category.fromJson(i)).toList();
      } else {
        dioRepository.snackBar(res['resultMessage']);
        throw CustomException(errorMsg: res['resultMessage']);
      }
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
      throw CustomException(errorMsg: e.toString().toUpperCase());
    }
  }

  Future<List<LevelEvent>> getLevelEvent() async {
    try {
      final res = await HttpHelper().getUrl(url: 'ppv/GettingStart');
      if (res['isSuccess']) {
        var list = res['levels'] as List;
        return list.map((i) => LevelEvent.fromJson(i)).toList();
      } else {
        dioRepository.snackBar(res['resultMessage']);
        throw CustomException(errorMsg: res['resultMessage']);
      }
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
      throw CustomException(errorMsg: e.toString().toUpperCase());
    }
  }

  // ignore: non_constant_identifier_names
  Future<List<Event>> getLevelAllEvent(
      {String? level_id, int? pageNumber, int? pageSize}) async {
    try {
      final res = await HttpHelper().getUrl(
          url:
              'ppv/LevelAll/$level_id?pageNumber=$pageNumber&pageSize=$pageSize');
      if (res['isSuccess']) {
        var list = res['events'] as List;
        return list.map((i) => Event.fromJson(i)).toList();
      } else {
        dioRepository.snackBar(res['resultMessage']);
        throw CustomException(errorMsg: res['resultMessage']);
      }
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
      throw CustomException(errorMsg: e.toString().toUpperCase());
    }
  }

  Future<List<dynamic>> getContentDetail({String? contentId}) async {
    try {
      final res =
          await HttpHelper().getUrl(url: 'ppv/ContentDetial/$contentId');
      PaymentInfo paymentInfo = PaymentInfo.fromJson(res['paymentInfo']);
      if (res['isSuccess']) {
        var list = res['movies'] as List;
        return [list.map((i) => Movie.fromJson(i)).toList(), paymentInfo];
      } else {
        dioRepository.snackBar(res['resultMessage']);
        throw CustomException(errorMsg: res['resultMessage']);
      }
    } catch (e) {
      // print(e.toString());
      dioRepository.snackBar(e.toString().toUpperCase());
      throw CustomException(errorMsg: e.toString().toUpperCase());
    }
  }

  Future<List<VideoCueParagraph>> getMovieCue({String? movieId}) async {
    try {
      final res = await HttpHelper().getUrl(url: 'ppv/Movie/$movieId');
      if (res['isSuccess']) {
        var list = res['cue'] as List;
        return list.map((i) => VideoCueParagraph.fromJson(i)).toList();
      } else {
        dioRepository.snackBar(res['resultMessage']);
        throw CustomException(errorMsg: res['resultMessage']);
      }
    } catch (e) {
      // print(e.toString());
      dioRepository.snackBar(e.toString().toUpperCase());
      throw CustomException(errorMsg: e.toString().toUpperCase());
    }
  }

  Future getVideoVocabulary(
      {int? pageNumber, int? pageSize, int? mode, String? movieId}) async {
    try {
      final res = await HttpHelper().getUrl(
          url:
              'ppv/Movie/Vocabulary/$movieId/$mode?pageNumber=$pageNumber&pageSize=$pageSize');
      if (res['isSuccess']) {
        if (res['words'] != null) {
          var list = res['words'] as List;
          var words = list.map((i) => VideoVocabularyWord.fromJson(i)).toList();
          return VideoVocabulary(res['wordCount'], words);
        } else {
          return VideoVocabulary(res['wordCount'], []);
        }
      } else {
        dioRepository.snackBar(res['resultMessage']);
        throw CustomException(errorMsg: res['resultMessage']);
      }
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
      throw CustomException(errorMsg: e.toString().toUpperCase());
    }
  }
}
