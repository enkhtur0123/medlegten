import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/models/video/movie.dart';
import 'package:medlegten/models/video/video_cue.dart';
import 'package:medlegten/pages/CoursePages/Unit_introVideo/intro_video_subtitle.dart';
import 'package:medlegten/pages/CoursePages/base/base_video_page.dart';
import 'package:medlegten/pages/CoursePages/base/cue_word_widget.dart';
import 'package:medlegten/pages/CoursePages/base/cue_wrapper.dart';
import 'package:medlegten/pages/VideoPage/video_subtitle.dart';
import 'package:medlegten/repositories/video_repository.dart';

import 'video_helper.dart';

class VideoDetailPage extends BaseVideoPage {
  const VideoDetailPage(this.url,
      {Key? key, this.movies, this.title = "Video", this.isSerial})
      : super(url, key: key);
  final String url;
  final List<Movie>? movies;
  final String? title;
  final bool? isSerial;

  @override
  State<StatefulWidget> createState() {
    return VideoDetailPageState();
  }
}

class VideoDetailPageState extends BaseVideoPageState<VideoDetailPage>
    with BaseVideoMixin {
  CWord? word;
  Rect position = Rect.zero;
  bool bottomIsVisible = false;
  late final ValueNotifier<bool> refreshNotifier = ValueNotifier(false);
  List<VideoCueParagraph>? videoCueParagraph;

  @override
  void initState() {
    super.initState();
    getVideoCueParagraph().then((value) {
      videoCueParagraph = value;
    });
    videoPlayerController.addListener(() {
      if (videoPlayerController.value.isPlaying && bottomIsVisible) {
        bottomIsVisible = false;
        word = null;
        refreshNotifier.value = !refreshNotifier.value;
      }
    });
  }

  Future<List<VideoCueParagraph>> getVideoCueParagraph() async {
    return await VideoRepository()
        .getMovieCue(movieId: widget.movies![0].movieId);
  }

  @override
  Widget subtitleWidget() {
    return videoCueParagraph != null
        ? VideoSubtitle(
            videoPlayerController,
            VideoHelper.convert(videoCueParagraph!),
            (cword, pposition) {
              if (cword != null) {
                word = cword;
                position = pposition;
                refreshNotifier.value = !refreshNotifier.value;
              }
            },
            bookMark: () {
              print("bookMark");
            },
            isBookMark: true,
          )
        : super.subtitleWidget();
  }

  @override
  Widget bottomSheetWidget() {
    return ValueListenableBuilder<bool>(
        builder: (BuildContext context, bool value, Widget? child) {
          return _showBottomSheet(context, word, position);
        },
        valueListenable: refreshNotifier);
  }

  Widget _showBottomSheet(context, CWord? word, Rect position) {
    if (word == null) return const SizedBox(height: 1);
    bottomIsVisible = true;
    return BottomSheet(
      backgroundColor: colorWhite,
      enableDrag: false,
      builder: (BuildContext context) {
        return CueWordWidget(
          word,
          ppointerPosition: position,
          isshadow: false,
        );
      },
      onClosing: () {},
    );
  }
}