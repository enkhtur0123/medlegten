import 'package:medlegten/models/Landing/course_info.dart';
import 'package:medlegten/models/Landing/course_unit.dart';
import 'package:medlegten/models/Landing/course_unit_module_list.dart';
import 'package:medlegten/models/Landing/customer_review.dart';
import 'package:medlegten/models/Landing/quiz_history.dart';
import 'package:medlegten/models/Landing/self_quiz.dart';
import 'package:medlegten/repositories/repository.dart';
import 'package:medlegten/services/custom_exception.dart';
import 'package:medlegten/services/http_helper.dart';

class LandingRepository {
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
      print(e.toString());
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
    try {
      final res = await HttpHelper()
          .postUrl(url: 'Course/SelfQuiz/SetHistory', body: body);
      if (res['isSuccess']) {
        return res;
      } else {
        throw CustomException(errorMsg: res['resultMessage']);
      }
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
}
