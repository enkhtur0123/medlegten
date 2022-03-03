import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medlegten/models/Unit/unit_introduction_cue_word.dart';
import 'package:medlegten/models/article/last_seen_article.dart';
import 'package:medlegten/models/promotion/promotion.dart';
import 'package:medlegten/models/video/event.dart';
import 'package:medlegten/models/video/last_seen_video.dart';
import 'package:medlegten/models/video/movie.dart';

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
    List<Promotion>? promotions
  ) = _LastSeen;

  factory LastSeen.fromJson(Map<String, dynamic> json) =>
      _$LastSeenFromJson(json);
}
