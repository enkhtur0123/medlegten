import 'package:flutter/material.dart';
import 'package:medlegten/pages/CoursePages/base/base_video_subtitle.dart';
import 'package:medlegten/pages/CoursePages/base/cue_wrapper.dart';
import 'package:video_player/video_player.dart';

class IntroVideoSubtitle extends BaseVideoSubtitlePage {
  const IntroVideoSubtitle(VideoPlayerController videoPlayerController,
      List<CParagraph> paragraph, SubtitleWordCallback callback, {Key? key})
      : super(videoPlayerController, paragraph,
            pwordCallback: callback, key: key);

  @override
  _IntroVideoSubtitleState createState() => _IntroVideoSubtitleState();
}

class _IntroVideoSubtitleState
    extends BaseVideoSubtitleState<IntroVideoSubtitle>
    with BaseVideoSubtitleMixin {}
