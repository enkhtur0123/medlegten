import 'package:freezed_annotation/freezed_annotation.dart';

part 'mile_stone_item.freezed.dart';
part 'mile_stone_item.g.dart';

@freezed
class MileStoneItem with _$MileStoneItem {
  factory MileStoneItem(String? id, String? name, String? desc, String? ppvNum,
      String? wordNum, String? ordering) = _MileStoneItem;

  factory MileStoneItem.fromJson(Map<String, dynamic> json) =>
      _$MileStoneItemFromJson(json);
}
