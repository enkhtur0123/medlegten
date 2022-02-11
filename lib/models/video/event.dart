import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
class Event with _$Event {
  factory Event(String eventId,
          String eventName,
          String categoryName,
          bool isPurchased,
          String levelId,
          String vocabularyCount,
          String imgUrl,
          String intro,
          String isSerial) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) =>
      _$EventFromJson(json);
}
