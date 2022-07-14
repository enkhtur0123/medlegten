import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/video/event.dart';

part 'level_event.freezed.dart';
part 'level_event.g.dart';

@freezed
class LevelEvent with _$LevelEvent {
  factory LevelEvent(String? levelId, String? levelName, List<Event> events) = _LevelEvent;

  factory LevelEvent.fromJson(Map<String, dynamic> json) =>
      _$LevelEventFromJson(json);
}
