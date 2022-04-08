import 'package:medlegten/models/Landing/app_bar_data.dart';
import 'package:medlegten/models/Landing/course_info.dart';
import 'package:medlegten/models/Landing/course_unit.dart';
import 'package:medlegten/models/Landing/course_unit_module_list.dart';
import 'package:medlegten/models/Landing/customer_review.dart';
import 'package:medlegten/models/Landing/last_seen.dart';
import 'package:medlegten/models/Landing/last_seen_unit_info.dart';
import 'package:medlegten/models/Landing/quiz_history.dart';
import 'package:medlegten/models/Landing/self_quiz.dart';
import 'package:medlegten/repositories/repository.dart';
import 'package:medlegten/services/custom_exception.dart';
import 'package:medlegten/services/http_helper.dart';

class LandingRepository {
  Future<LastSeenUnitInfo> getLastSeenUnitInfo(
      {String? unitId, String? moduleId, String? moduleTypeId}) async {
    //  await  GetStorage().remove("token");
    try {
      final res = await HttpHelper()
          .getUrl(url: 'Course/LastSeenUnitModule/$unitId/$moduleId');
      if (res['isSuccess']) {
        return LastSeenUnitInfo.fromJson(res);
      } else {
        dioRepository.snackBar(res['resultMessage']);
        throw CustomException(errorMsg: res['resultMessage']);
      }
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
      throw CustomException(errorMsg: e.toString().toUpperCase());
    }
  }

  Future<LastSeen> getLastSeen() async {
    try {
      final res = await HttpHelper().getUrl(url: 'UserInfo/LastSeen');
      if (res['isSuccess']) {
        return LastSeen.fromJson(res);
      } else {
        dioRepository.snackBar(res['resultMessage']);
        throw CustomException(errorMsg: res['resultMessage']);
      }
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
      throw CustomException(errorMsg: e.toString().toUpperCase());
    }
  }

  Future<List<CourseUnitModuleList>?> getCourseUnitModuleList(String id) async {
    try {
      final res = await HttpHelper().getUrl(url: 'Course/UnitModule/$id');

      if (res['isSuccess']) {
        var list = res['unitModules'] as List;
        return list.map((i) => CourseUnitModuleList.fromJson(i)).toList();
      } else {
        dioRepository.snackBar(res['resultMessage']);
        throw CustomException(errorMsg: res['resultMessage']);
      }
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
      throw CustomException(errorMsg: e.toString().toUpperCase());
    }
  }

  Future<List<CourseInfo>?> getCourseList() async {
    try {
      final res = await HttpHelper().getUrl(url: 'Course');
      print(res);
      if (res['isSuccess']) {
        var list = res['courseList'] as List;
        return list.map((i) => CourseInfo.fromJson(i)).toList();
      } else {
        dioRepository.snackBar(res['resultMessage']);
        throw CustomException(errorMsg: res['resultMessage']);
      }
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
      throw CustomException(errorMsg: e.toString().toUpperCase());
    }
  }

  Future<List<CourseUnit>?> getCourseUnitList(String courseId) async {
    try {
      final res = await HttpHelper().getUrl(url: 'Course/Unit/$courseId');
      if (res['isSuccess']) {
        // print(res['courseUnitList']);
        var list = res['courseUnitList'] as List;
        return list.map((i) => CourseUnit.fromJson(i)).toList();
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

  Future<SelfQuiz?> getSelfQuiz() async {
    try {
      final res = await HttpHelper().getUrl(url: 'Course/SelfQuiz');
      if (res['isSuccess']) {
        return SelfQuiz.fromJson(res['quizInfo']);
      } else {
        dioRepository.snackBar(res['resultMessage']);
        throw CustomException(errorMsg: res['resultMessage']);
      }
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
      throw CustomException(errorMsg: e.toString().toUpperCase());
    }
  }

  Future<List<CustomerReview>?> getCustomerReviewList(int count) async {
    try {
      final res = await HttpHelper().getUrl(url: 'Course/Review/$count');
      if (res['isSuccess']) {
        var list = res['reviews'] as List;
        return list.map((i) => CustomerReview.fromJson(i)).toList();
      } else {
        dioRepository.snackBar(res['resultMessage']);
        throw CustomException(errorMsg: res['resultMessage']);
      }

      // return [
      //   CustomerReview(
      //       '1',
      //       'http://angular-material.fusetheme.com/assets/images/avatars/brian-hughes.jpg',
      //       'Bold Bayarsaikhan',
      //       '12-р сургууль',
      //       'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
      //       4)
      // ];
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
      throw CustomException(errorMsg: e.toString().toUpperCase());
    }
  }

  Future<QuizHistory?> getQuizHistory() async {
    try {
      final res = await HttpHelper().getUrl(url: 'Course/SelfQuiz/History');
      if (res['isSuccess']) {
        return QuizHistory.fromJson(res['quizDetial']);
      } else {
        dioRepository.snackBar(res['resultMessage']);
        throw CustomException(errorMsg: res['resultMessage']);
      }
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
      throw CustomException(errorMsg: e.toString().toUpperCase());
    }
  }

  //// Шалгалтын мэдээлэл хадгалах сервис
  Future<dynamic> setCourseSelfTestHistory({Map<String, dynamic>? body}) async {
    // print(body);
    try {
      final res = await HttpHelper()
          .postUrl(url: 'Course/SelfQuiz/SetHistory', body: body);
      // print(res);
      if (res['isSuccess']) {
        return res;
      } else {
        dioRepository.snackBar(res['resultMessage']);
      }
    } on CustomException catch (ex) {
      dioRepository.snackBar(ex.toString().toUpperCase());
      throw CustomException(errorMsg: ex.toString());
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
      throw CustomException(errorMsg: e.toString());
    }
  }

  //// Шалгалтын мэдээлэл авах
  Future<dynamic> getSelfTestDetail() async {
    try {
      final res = await HttpHelper().getUrl(url: 'Course/SelfQuiz/History');
      if (res['isSuccess']) {
        return res;
      } else {
        dioRepository.snackBar(res['resultMessage']);
        throw CustomException(errorMsg: res['resultMessage']);
      }
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
      throw CustomException(errorMsg: e.toString());
    }
  }

  //// Мэдээлэл авах
  Future<AppBarData> getAppbarData() async {
    try {
      final res = await HttpHelper().getUrl(url: 'UserInfo/AppBar');
      AppBarData appBarData = AppBarData.fromJson(res['appBarText']);

      if (res['isSuccess']) {
        return appBarData;
      } else {
        dioRepository.snackBar(res['resultMessage']);
        throw CustomException(errorMsg: res['resultMessage']);
      }
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
      throw CustomException(errorMsg: e.toString());
    }
  }
}
