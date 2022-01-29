import 'package:flutter/material.dart';
import 'package:medlegten/pages/CoursePages/base/base_video_subtitle.dart';
import 'package:medlegten/pages/CoursePages/base/cue_wrapper.dart';
import 'package:video_player/video_player.dart';

class ConversationVideoSubtitle extends BaseVideoSubtitlePage {
  const ConversationVideoSubtitle(
      VideoPlayerController videoPlayerController, List<CParagraph> paragraph,
      {Key? key})
      : super(videoPlayerController, paragraph, key: key);

  @override
  _ConversationVideoSubtitleState createState() =>
      _ConversationVideoSubtitleState();
}

class _ConversationVideoSubtitleState
    extends BaseVideoSubtitleState<ConversationVideoSubtitle>
    with BaseVideoSubtitleMixin {}
