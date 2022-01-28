import 'package:freezed_annotation/freezed_annotation.dart';
part 'onboarding.freezed.dart';
part 'onboarding.g.dart';

@freezed
class Onboarding with _$Onboarding {
  factory Onboarding(
    int id,
    String btnSkipBgColor,
    String btnSkipTxtColor,
    String btnCarouselBgColor,
    String btnCarouselArrowColor,
    String btnIndicatorActiveBgColor,
    String btnIndicatorInactiveBgColor,
    String mainImageUrl,
    int ordering,
  ) = _Onboarding;

  factory Onboarding.fromJson(Map<String, dynamic> json) =>
      _$OnboardingFromJson(json);
}
