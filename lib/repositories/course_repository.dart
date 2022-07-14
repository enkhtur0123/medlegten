import 'package:medlegten/services/custom_exception.dart';
import 'package:medlegten/services/http_helper.dart';

import 'repository.dart';

class CourseRepository {
  ///
  Future<dynamic> setCoursePlan({String? id}) async {
    // print("plan");
    try {
      final res = await HttpHelper().getUrl(url: 'Course/Plan/$id');
      if (res['isSuccess']) {
        return res;
      } else {
        dioRepository.snackBar(res['resultMessage']);
        throw CustomException(errorMsg: res['resultMessage']);
      }
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
      throw CustomException(errorMsg: e.toString().toUpperCase());
    }
  }

  // 1 is complete module, 0 is uncomplete module
  Future<dynamic> setUnitModuleComplete(
      {String? completeType, String? moduleId}) async {
    try {
      final res = await HttpHelper()
          .getUrl(url: 'Course/UnitModule/Complete/$moduleId/$completeType');
      if (res['isSuccess']) {
        return res["resultMessage"];
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
