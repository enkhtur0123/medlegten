import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_review.freezed.dart';
part 'customer_review.g.dart';

@freezed
class CustomerReview with _$CustomerReview {
  factory CustomerReview(
      String reviewId,
      String fullName,
      String bioTitle,
      String startRating,
      String profileImg,
      String desc,
      String ordering) = _CustomerReview;

  factory CustomerReview.fromJson(Map<String, dynamic> json) =>
      _$CustomerReviewFromJson(json);
}
