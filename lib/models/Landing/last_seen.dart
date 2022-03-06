import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/Unit/last_seen_unit.dart';
import 'package:medlegten/models/article/last_seen_article.dart';
import 'package:medlegten/models/promotion/promotion.dart';
import 'package:medlegten/models/video/event.dart';
import 'package:medlegten/models/video/last_seen_video.dart';

part 'last_seen.freezed.dart';
part 'last_seen.g.dart';

@freezed
class LastSeen with _$LastSeen {
  factory LastSeen(
    bool? isSuccess,
    String? errorCode,
    String? resultMessage,
    LastSeenArticle? lastSeenArticle,
    LastSeenVideo? lastSeenPPV,
    List<Event>? recommends,
    LastSeenUnit? lastSeenUnit,
    List<Promotion>? promotions
  ) = _LastSeen;

  factory LastSeen.fromJson(Map<String, dynamic> json) =>
      _$LastSeenFromJson(json);
}
