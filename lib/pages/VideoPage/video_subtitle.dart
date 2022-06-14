import 'package:flutter/material.dart';
import 'package:medlegten/models/video/memorize_word.dart';
import 'package:medlegten/pages/CoursePages/base/base_paragraph.dart';
import 'package:medlegten/pages/CoursePages/base/base_video_subtitle.dart';
import 'package:medlegten/pages/CoursePages/base/cue_wrapper.dart';
import 'package:video_player/video_player.dart';

class VideoSubtitle extends BaseVideoSubtitlePage {
  const VideoSubtitle(VideoPlayerController videoPlayerController,
      List<CParagraph> paragraph, SubtitleWordCallback callback,
      {Key? key,
      bool? isBookMark,
      Function? bookMark,
      bool? isMemorize,
      VideoMemorizeWord? videoMemorizeWord})
      : super(videoPlayerController, paragraph,
          pwordCallback: callback,
          key: key,
          isBookMark: true,
          bookMark: bookMark,
          isMemorize: isMemorize,
          videoMemorizeWord: videoMemorizeWord,
        );

  @override
   VideoSubtitleState createState() => VideoSubtitleState();
}
class VideoSubtitleState
    extends BaseVideoSubtitleState<VideoSubtitle>
    with BaseVideoSubtitleMixin {}
