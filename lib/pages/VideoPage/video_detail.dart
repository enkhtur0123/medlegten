import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/models/video/memorize_word.dart';
import 'package:medlegten/models/video/movie.dart';
import 'package:medlegten/models/video/quiz.dart';
import 'package:medlegten/models/video/video_cue.dart';
import 'package:medlegten/pages/CoursePages/base/base_video_page.dart';
import 'package:medlegten/pages/CoursePages/base/cue_word_widget.dart';
import 'package:medlegten/pages/CoursePages/base/cue_wrapper.dart';
import 'package:medlegten/pages/VideoPage/video_subtitle.dart';
import 'package:medlegten/repositories/video_repository.dart';
import 'package:medlegten/utils/app_router.dart';
import 'package:medlegten/widgets/loader.dart';
import 'package:video_player/video_player.dart';

import '../../services/custom_exception.dart';
import '../../widgets/snackbar/custom_snackbar.dart';
import 'video_helper.dart';

class VideoDetailPage extends BaseVideoPage {
  const VideoDetailPage(
    this.url, {
    Key? key,
    this.movies,
    this.title,
    this.isSerial,
    this.serialChange,
    this.contentId,
    this.quiz,
    this.isMemorize,
  }) : super(url, isSerial: isSerial, movies: movies, key: key);
  final String url;
  final String? contentId;
  final List<Movie>? movies;
  final String? title;
  final bool? isSerial;
  final VideoQuiz? quiz;
  final bool? isMemorize;
  final Function(int currentIndex)? serialChange;
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
  late String movieId;
  VideoMemorizeWord? videoMemorizeWord;
  @override
  void initState() {
    super.initState();
    videoMemorizeWord = widget.videoMemorizeWord;
    movieId = widget.movies![0].movieId!;
    setVideoListener(videoPlayerController!);
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
              movies: widget.movies,
              contentId: widget.contentId,
              videoMemorizeWord: videoMemorizeWord,
              videoUrl: widget.url,
              quizBtn: () {
                
                quiz();
              },
              isBookMark: true,
            );
          } else {
            return super.subtitleWidget();
          }
        });
  }

  void quiz() async {
    VideoQuiz? quiz;
    await videoPlayerController!.pause();
    try {
      LoadingIndicator(context: context).showLoadingIndicator();
      quiz = await VideoRepository().getVideoQuiz(contentId: widget.contentId);
      LoadingIndicator(context: context).hideLoadingIndicator();
      AutoRouter.of(context).push(
        VideoQuizRoute(
            videoQuiz: quiz, title: "Шалгалт", contentId: widget.contentId),
      );
    } on CustomException catch (Ex) {
      LoadingIndicator(context: context).hideLoadingIndicator();
      ScaffoldMessenger.of(context).showSnackBar(
        MySnackBar(
          text: Ex.errorMsg.toString(),
        ),
      );
    } catch (ex) {
      LoadingIndicator(context: context).hideLoadingIndicator();
      ScaffoldMessenger.of(context).showSnackBar(MySnackBar(
        text: ex.toString(),
      ));
    }
  }

  @override
  onTapIndex(int index) {
    movieId = widget.movies![index].movieId!;
    super.subtitleWidget();
    super.initVideoPlayer(changedUrl: widget.movies![index].hostUrl);
  }

  @override
  setVideoController(VideoPlayerController controller) {
    videoPlayerController = controller;
    setVideoListener(videoPlayerController!);
    setState(() {});
  }

  setVideoListener(VideoPlayerController controller) {
    controller.addListener(() {
      if (controller.value.isPlaying && bottomIsVisible) {
        bottomIsVisible = false;
        word = null;
        refreshNotifier.value = !refreshNotifier.value;
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
