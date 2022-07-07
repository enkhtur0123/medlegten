import 'package:freezed_annotation/freezed_annotation.dart';

part 'coupon.freezed.dart';
part 'coupon.g.dart';

@freezed
class Coupon with _$Coupon {
  factory Coupon(
      bool isUse,
      String couponCode,
      String price,
      String courseId,
      String expireDate,
      String usedCount,
      String limit,
      String month) = _Coupon;

  factory Coupon.fromJson(Map<String, dynamic> json) => _$CouponFromJson(json);
}
