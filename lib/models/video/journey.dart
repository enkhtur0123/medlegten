import 'package:freezed_annotation/freezed_annotation.dart';

part 'journey.freezed.dart';
part 'journey.g.dart';

@freezed
class Journey with _$Journey {
  factory Journey( 
    String? eventId,
    String? eventName,
    String? imgUrl,
    String? runTime,
    String? vocabularyCount,
    String? vocabularyKnow,
    String? categoryName,
    String? isSerial
  ) = _Journey;

  factory Journey.fromJson(Map<String, dynamic> json) =>
      _$JourneyFromJson(json);
}

