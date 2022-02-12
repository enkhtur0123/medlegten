import 'package:medlegten/models/Landing/course_info.dart';
import 'package:medlegten/services/custom_exception.dart';
import 'package:medlegten/services/http_helper.dart';

/// Харах
class CoursePaymentRepository {
  Future<dynamic> checkCouponCode(
      {CourseInfo? courseInfo, String? couponCode}) async {
    try {
      var res = await HttpHelper()
          .getUrl(url: 'Course/Coupon/${courseInfo!.courseId}/$couponCode');
      if (res['isSuccess']) {
        return res;
      } else {
        return null;
      }
    } catch (ex) {
      throw CustomException(errorMsg: ex.toString());
    }
  }

  Future<List<dynamic>> createInvoice({Map<String, dynamic>? body}) async {
    try {
      var res = await HttpHelper().postUrl(url: 'Payments', body: body);
      if (res['isSuccess']) {
        return res["qpay"]["urls"];
      } else {
        return [];
      }
    } catch (ex) {
      throw CustomException(errorMsg: ex.toString());
    }
  }
}
