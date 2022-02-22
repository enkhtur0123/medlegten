import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_info.freezed.dart';
part 'payment_info.g.dart';

@freezed
class PaymentInfo with _$PaymentInfo {
  factory PaymentInfo(
    bool? isPurchased,
    String? isExpireDate,
    String? productId,
    String? productName,
    String? productDesc,
    String? price) = _PaymentInfo;

  factory PaymentInfo.fromJson(Map<String, dynamic> json) =>
      _$PaymentInfoFromJson(json);
}
