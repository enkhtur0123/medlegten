import 'package:medlegten/models/Landing/course_info.dart';
import 'package:medlegten/models/video/payment_info.dart';
import 'package:medlegten/services/custom_exception.dart';
import 'package:medlegten/services/http_helper.dart';

/// Харах
class CoursePaymentRepository {
  Future<dynamic> checkCouponCode(
      {CourseInfo? courseInfo,
      String? couponCode,
      PaymentInfo? paymentInfo,
      bool? isCourse}) async {
    try {
      var res = await HttpHelper().getUrl(
          url:
              'Course/Coupon/${isCourse! ? courseInfo!.courseId : paymentInfo!.productId}/$couponCode');
      if (res['isSuccess']) {
        return res;
      } else {
        return null;
      }
    } catch (ex) {
      throw CustomException(errorMsg: ex.toString());
    }
  }

  // ignore: non_constant_identifier_names
  Future<dynamic> checkPaymentStatus({String? invoice_id}) async {
    try {
      var res = await HttpHelper()
          .getUrl(url: 'Payments/Check?payment_id=$invoice_id');
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
        return [res["qpay"]["urls"], res["invoiceNo"]];
      } else {
        return [];
      }
    } catch (ex) {
      throw CustomException(errorMsg: ex.toString());
    }
  }
}
