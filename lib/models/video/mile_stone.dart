import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/video/mile_stone_item.dart';

part 'mile_stone.freezed.dart';
part 'mile_stone.g.dart';

@freezed
class MileStone with _$MileStone {
  factory MileStone(List<MileStoneItem>? mileStone, int completedPpvCount,
      int knowingWordCount) = _MileStone;

  factory MileStone.fromJson(Map<String, dynamic> json) =>
      _$MileStoneFromJson(json);
}
