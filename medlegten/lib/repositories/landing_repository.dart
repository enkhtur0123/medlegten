import 'dart:convert';
import 'package:medlegten/models/Landing/course_info.dart';
import 'package:medlegten/models/Landing/course_unit.dart';
import 'package:medlegten/models/Landing/customer_review.dart';
import 'package:medlegten/models/Landing/quiz_history.dart';
import 'package:medlegten/repositories/repository.dart';

class LandingRepository {
  Future<List<CourseInfo>?> getCourseList() async {
    try {
      final response = await dioRepository.instance.get('Course');
      final res = json.decode('$response');
      if (res['isSuccess']) {
        var list = res['courseList'] as List;
        return list.map((i) => CourseInfo.fromJson(i)).toList();
      } else {
        dioRepository.snackBar(res['resultMessage']);
        return null;
      }
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
      return null;
    }
  }

  Future<List<CourseUnit>?> getCourseUnitList(String courseId) async {
    try {
      final response =
          await dioRepository.instance.get('Course/Unit/$courseId');
      final res = json.decode('$response');
      if (res['isSuccess']) {
        var list = res['courseUnitList'] as List;
        return list.map((i) => CourseUnit.fromJson(i)).toList();
      } else {
        dioRepository.snackBar(res['resultMessage']);
        return null;
      }
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
      return null;
    }
  }

  Future<List<CustomerReview>?> getCustomerReviewList(int count) async {
    try {
      // final response =
      //     await dioRepository.instance.get('Course/Unit/$courseId');
      // final res = json.decode('$response');
      // if (res['isSuccess']) {
      //   var list = res['courseUnitList'] as List;
      //   return list.map((i) => CourseUnit.fromJson(i)).toList();
      // } else {
      //   dioRepository.snackBar(res['resultMessage']);
      //   return null;
      // }
      return [
        CustomerReview(
            '1',
            'http://angular-material.fusetheme.com/assets/images/avatars/brian-hughes.jpg',
            'Bold Bayarsaikhan',
            '12-р сургууль',
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
            4)
      ];
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
      return null;
    }
  }

  Future<QuizHistory?> getQuizHistory() async {
    try {
      final response =
          await dioRepository.instance.get('Course/SelfQuiz/History');
      final res = json.decode('$response');
      if (res['isSuccess']) {
        return QuizHistory.fromJson(res['quizDetial']);
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
