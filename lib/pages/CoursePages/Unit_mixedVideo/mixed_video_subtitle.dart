import 'package:flutter/material.dart';
import 'package:medlegten/pages/CoursePages/base/base_paragraph.dart';
import 'package:medlegten/pages/CoursePages/base/base_video_subtitle.dart';
import 'package:medlegten/pages/CoursePages/base/cue_wrapper.dart';
import 'package:video_player/video_player.dart';

class MixedVideoSubtitle extends BaseVideoSubtitlePage {
  const MixedVideoSubtitle(VideoPlayerController videoPlayerController,
      List<CParagraph> paragraph, SubtitleParagraphCallback callback,
      {Key? key})
      : super(videoPlayerController, paragraph,
            pparagraphCallback: callback, key: key);

  @override
  _MixedVideoSubtitleState createState() => _MixedVideoSubtitleState();
}

class _MixedVideoSubtitleState
    extends BaseVideoSubtitleState<MixedVideoSubtitle>
    with BaseVideoSubtitleMixin {}
