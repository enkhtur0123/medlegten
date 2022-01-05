import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_review.freezed.dart';
part 'customer_review.g.dart';

@freezed
class CustomerReview with _$CustomerReview {
  factory CustomerReview(String reviewId, String profileImg, String fullName,
      String position, String description, int star) = _CustomerReview;

  factory CustomerReview.fromJson(Map<String, dynamic> json) =>
      _$CustomerReviewFromJson(json);
}
