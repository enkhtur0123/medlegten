import 'package:flutter/material.dart';
import 'package:medlegten/models/video/memorize_word.dart';
import 'package:medlegten/pages/CoursePages/base/base_paragraph.dart';
import 'package:medlegten/pages/CoursePages/base/base_video_subtitle.dart';
import 'package:medlegten/pages/CoursePages/base/cue_wrapper.dart';
import 'package:video_player/video_player.dart';

import '../../models/video/movie.dart';
import '../../models/video/quiz.dart';

class VideoSubtitle extends BaseVideoSubtitlePage {
  const VideoSubtitle(
      VideoPlayerController videoPlayerController, List<CParagraph> paragraph, SubtitleWordCallback callback,
      {Key? key,
      bool? isBookMark,
      Function? bookMark,
      bool? isMemorize,
      String? contentId,
      List<Movie>? movies,
      String? videoUrl,
      VideoMemorizeWord? videoMemorizeWord,
      VideoQuiz? quiz,
      String? title,
      Function(String? type)? memorizeTypeBtn})
      : super(
          videoPlayerController,
          paragraph,
          pwordCallback: callback,
          key: key,
          isBookMark: true,
          bookMark: bookMark,
          isMemorize: isMemorize,
          videoMemorizeWord: videoMemorizeWord,
          quiz: quiz,
          title: title,
          contentId: contentId,
          movies: movies,
          videoUrl: videoUrl,
          memorizeTypeBtn: memorizeTypeBtn,
          sonsgol: sonsgol,
        );

  @override
  VideoSubtitleState createState() => VideoSubtitleState();
}

class VideoSubtitleState extends BaseVideoSubtitleState<VideoSubtitle> with BaseVideoSubtitleMixin {}
