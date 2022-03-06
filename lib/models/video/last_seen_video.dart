import 'package:freezed_annotation/freezed_annotation.dart';

part 'last_seen_video.freezed.dart';
part 'last_seen_video.g.dart';

@freezed
class LastSeenVideo with _$LastSeenVideo {
  factory LastSeenVideo( 
    String? contentId,
    String? contentName,
   String? imgUrl,String isSerial) = _LastSeenVideo;

  factory LastSeenVideo.fromJson(Map<String, dynamic> json) =>
      _$LastSeenVideoFromJson(json);
}
