import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/models/video/memorize_word.dart';
import 'package:medlegten/models/video/movie.dart';
import 'package:medlegten/models/video/quiz.dart';
import 'package:medlegten/pages/CoursePages/base/base_video_page.dart';
import 'package:medlegten/pages/CoursePages/base/cue_wrapper.dart';
import 'package:medlegten/pages/VideoPage/video_helper.dart';
import 'package:medlegten/pages/VideoPage/video_subtitle.dart';
import 'package:medlegten/utils/app_router.dart';
import '../../models/video/video_cue.dart';
import '../../repositories/video_repository.dart';
import '../CoursePages/base/cue_word_widget.dart';

class VideoMemorizePage extends BaseVideoPage {
  VideoMemorizePage(
    this.url, {
    Key? key,
    this.movies,
    this.title,
    this.isSerial,
    this.serialChange,
    this.contentId,
    this.quiz,
    this.isMemorize,
    this.videoMemorizeWord,
  }) : super(url, isSerial: isSerial, movies: movies, key: key);
  final String url;
  final String? contentId;
  final List<Movie>? movies;
  final String? title;
  final bool? isSerial;
  final VideoQuiz? quiz;
  final bool? isMemorize;
  final VideoMemorizeWord? videoMemorizeWord;
  final Function(int currentIndex)? serialChange;

  @override
  State<StatefulWidget> createState() {
    return VideoMemorizePageState();
  }
}

class VideoMemorizePageState extends BaseVideoPageState<VideoMemorizePage>
    with BaseVideoMixin {
  CWord? word;
  Rect position = Rect.zero;
  bool bottomIsVisible = false;
  late final ValueNotifier<bool> refreshNotifier = ValueNotifier(false);
  List<VideoCueParagraph>? videoCueParagraph;
  late String movieId;
  VideoMemorizeWord? videoMemorizeWord;
  @override
  void initState() {
    super.initState();
    videoMemorizeWord = widget.videoMemorizeWord;
    movieId = widget.movies![0].movieId!;
    videoPlayerController!.addListener(() async {
      // if (videoPlayerController!.value.position
      //         .compareTo(getDuration(widget.videoMemorizeWord!.endTime!)) ==
      //     0) {
      //   await videoPlayerController!.pause();
      // }
      if (videoPlayerController!.value.isPlaying && bottomIsVisible) {
        bottomIsVisible = false;
        word = null;
        // refreshNotifier.value = !refreshNotifier.value;
      }
    });
  }

  Future<List<VideoCueParagraph>> getVideoCueParagraph() async {
    return await VideoRepository().getMovieCue(movieId: movieId);
  }

  @override
  Widget subtitleWidget() {
    return FutureBuilder(
        future: getVideoCueParagraph(),
        builder: (context, AsyncSnapshot<List<VideoCueParagraph>> snapshot) {
          if (snapshot.hasData) {
            return VideoSubtitle(
              videoPlayerController!,
              VideoHelper.convert(snapshot.data!),
              (cword, pposition) {
                if (cword != null) {
                  word = cword;
                  position = pposition;
                  refreshNotifier.value = !refreshNotifier.value;
                }
              },
              isMemorize: true,
              videoMemorizeWord: videoMemorizeWord,
              bookMark: () {
                AutoRouter.of(context).push(
                  VideoVocabularyListRoute(movieId: movieId),
                );
              },
              isBookMark: true,
            );
          } else {
            return super.subtitleWidget();
          }
        });
  }

  @override
  Widget bottomSheetWidget() {
    return ValueListenableBuilder<bool>(
      builder: (BuildContext context, bool value, Widget? child) {
        return _showBottomSheet(context, word, position);
      },
      valueListenable: refreshNotifier,
    );
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
