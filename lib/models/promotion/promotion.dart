import 'package:freezed_annotation/freezed_annotation.dart';

part 'promotion.freezed.dart';
part 'promotion.g.dart';

@freezed
class Promotion with _$Promotion {
  factory Promotion(
     String promoId,
      String promoName,
      String imageUrl,
      String webUrl) =
      _Promotion;

  factory Promotion.fromJson(Map<String, dynamic> json) =>
      _$PromotionFromJson(json);
}
