import 'package:freezed_annotation/freezed_annotation.dart';

part 'slide_images.freezed.dart';
part 'slide_images.g.dart';

@freezed
class SlideImage with _$SlideImage {
  factory SlideImage(
    String? title,
    String? slideImageUrl,
    String? ordering,
  ) = _SlideImage;

  factory SlideImage.fromJson(Map<String, dynamic> json) =>
      _$SlideImageFromJson(json);
}
