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
import 'package:medlegten/themes/style.dart';
import 'package:medlegten/utils/app_router.dart';
import 'package:medlegten/widgets/buttons/custom_outlined_button.dart';
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
                if (widget.movies![0].isCompleted == "1") {
                  ScaffoldMessenger.of(context).showSnackBar(MySnackBar(
                    text:
                        "Та аль хэдийн шалгалтандаа тэнцсэн байна. Дахин өгөх шаардлагагүй",
                  ));
                } else {
                  quiz();
                }
              },
              isBookMark: true,
            );
          } else {
            return super.subtitleWidget();
          }
        });
  }

  void quiz() async {
    await videoPlayerController!.pause();
    VideoQuiz? quiz;
    try {
      LoadingIndicator(context: context).showLoadingIndicator();
      quiz = await VideoRepository().getVideoQuiz(contentId: widget.contentId);
      LoadingIndicator(context: context).hideLoadingIndicator();
      if (quiz.errorCode == "204") {
        ScaffoldMessenger.of(context).showSnackBar(MySnackBar(
          text: quiz.resultMessage,
        ));
      } else {
        await showModalBottomSheet<bool>(
          context: context,
          builder: (BuildContext context) {
            return Container(
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Шалгалт'.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: colorPrimary),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Үргэлжлэх хугацаа:${quiz!.quizDuration} сек',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: colorPrimary, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "• Агуулгын асуулт: ${quiz.contextQuiz!.length}",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "• Үгсийн сангийн асуулт:  ${quiz.vocQuiz!.length}",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    child: CustomOutlinedButton(
                      height: 40,
                      color: secondaryColor,
                      text: "Эхлэх",
                      onTap: () async {
                        try {
                          await VideoRepository().sentQuizResult(
                              contentId: widget.contentId, quizResult: "2");
                          Navigator.pop(context, true);
                        } catch (ex) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            MySnackBar(
                              text: ex.toString(),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ).then((value) async {
          if (value != null && value) {
            AutoRouter.of(context).push(
              VideoQuizRoute(
                  videoQuiz: quiz,
                  title: "Шалгалт",
                  contentId: widget.contentId),
            );
          }
        });
      }
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
