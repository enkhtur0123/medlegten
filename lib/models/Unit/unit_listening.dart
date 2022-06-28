import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/Unit/unit_listening_cue.dart';

part 'unit_listening.freezed.dart';
part 'unit_listening.g.dart';

@freezed
class UnitListening with _$UnitListening {
  factory UnitListening(String name, List<ListeningCue> cue) = _UnitListening;

  factory UnitListening.fromJson(Map<String, dynamic> json) =>
      _$UnitListeningFromJson(json);
}
