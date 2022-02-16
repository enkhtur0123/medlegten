import 'package:medlegten/models/video/category.dart';
import 'package:medlegten/models/video/event.dart';
import 'package:medlegten/models/video/level_event.dart';
import 'package:medlegten/models/video/movie.dart';
import 'package:medlegten/models/video/video_cue.dart';
import 'package:medlegten/repositories/repository.dart';
import 'package:medlegten/services/custom_exception.dart';
import 'package:medlegten/services/http_helper.dart';

class VideoRepository {
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
  Future<List<Event>> getLevelAllEvent({String? level_id}) async {
    try {
      final res = await HttpHelper().getUrl(url: 'ppv/LevelAll/$level_id');
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

  Future<List<Movie>> getContentDetail({String? contentId}) async {
    try {
      final res =
          await HttpHelper().getUrl(url: 'ppv/ContentDetial/$contentId');
      // print(res);
      if (res['isSuccess']) {
        var list = res['movies'] as List;
        return list.map((i) => Movie.fromJson(i)).toList();
      } else {
        dioRepository.snackBar(res['resultMessage']);
        throw CustomException(errorMsg: res['resultMessage']);
      }
    } catch (e) {
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
      print(e.toString());
      dioRepository.snackBar(e.toString().toUpperCase());
      throw CustomException(errorMsg: e.toString().toUpperCase());
    }
  }
}
