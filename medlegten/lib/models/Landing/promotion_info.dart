import 'package:freezed_annotation/freezed_annotation.dart';

part 'promotion_info.freezed.dart';
part 'promotion_info.g.dart';

@freezed
class PromotionInfo with _$PromotionInfo {
  factory PromotionInfo(String promoId, String title, String description,
      String imgUrl, String backroundImgUrl, int ordering) = _PromotionInfo;

  factory PromotionInfo.fromJson(Map<String, dynamic> json) =>
      _$PromotionInfoFromJson(json);
}
