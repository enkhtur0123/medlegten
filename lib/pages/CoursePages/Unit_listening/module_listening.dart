import 'dart:math';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';
import 'package:medlegten/models/Landing/course_unit.dart';
import 'package:medlegten/models/Unit/unit_listening_quiz_question.dart';
import 'package:medlegten/pages/CoursePages/Unit_listening/card_colors.dart';
import 'package:medlegten/pages/CoursePages/Unit_listening/common.dart';
import 'package:medlegten/pages/CoursePages/Unit_listening/control_button.dart';
import 'package:medlegten/pages/CoursePages/unit/unit_module_completed_btn.dart';
import 'package:rxdart/rxdart.dart';

class ModuleListenPage extends StatefulWidget {
  const ModuleListenPage(this.unitTitle,
      {Key? key,
      this.unitInfo,
      this.listeningQuiz,
      this.moduleId,
      this.isCompleted})
      : super(key: key);

  final CourseUnit? unitInfo;
  final ListeningQuiz? listeningQuiz;
  final String? moduleId;
  final bool? isCompleted;
  final String? unitTitle;

  @override
  _ModuleListenPageState createState() => _ModuleListenPageState();
}

class _ModuleListenPageState extends State<ModuleListenPage> {
  List<UriAudioSource>? uriAudioSource = [];
  final PageController controller =
      PageController(viewportFraction: 0.65, initialPage: 0);
  late AudioPlayer _player;
  bool isBottomSheet = false;

  ConcatenatingAudioSource? _playlist;

  List<List<Color>> randomColors = [];
  List<int> randomNumbers = [];
  int currentIndex = 0;
  ValueNotifier<List<ListenCheck>> listenChecks = ValueNotifier([]);
  ScrollPhysics scrollPhysics = const NeverScrollableScrollPhysics();

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    for (var item in widget.listeningQuiz!.listening.cue) {
      getRandom();
      listenChecks.value
          .add(ListenCheck(index: int.parse(item.cueId), isChecking: false));
      uriAudioSource!.add(
        AudioSource.uri(
          Uri.parse(item.hostUrl),
        ),
      );
    }
    _playlist = ConcatenatingAudioSource(children: uriAudioSource!);
    _init();
  }

  ///Аудио тохируулга болон listener
  Future<void> _init() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());

    /// Player ээ сонсож байна
    // _player.durationStream.listen((event) {
    //   if (event!.inSeconds != 0 &&
    //       event.inSeconds ==
    //           uriAudioSource![currentIndex].duration!.inSeconds) {
    //     // print(uriAudioSource![currentIndex].duration!.inSeconds);
    //   }
    // });
    // _player.playerStateStream.listen((state) {
    //   print(state.processingState);
    // });
    // _player.playbackEventStream.listen(
    //   (event) async {},
    //   onError: (Object e, StackTrace stackTrace) {},
    //   onDone: () {},
    // );
    try {
      await _player.setAudioSource(_playlist!, preload: false, initialIndex: 0);
    } catch (e) {}
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  int getRandom() {
    Random rnd;
    int min = 0;
    int max = 9;
    rnd = Random();
    int r = min + rnd.nextInt(max - min);
    randomNumbers.add(r);
    randomColors.add(cardColors[r]);
    return r;
  }

  @override
  // ignore: override_on_non_overriding_member
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeDependencies();
    if (state == AppLifecycleState.paused) {
      _player.stop();
    }
  }

  /// Stream байрлал
  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          _player.positionStream,
          _player.bufferedPositionStream,
          _player.durationStream,
          (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.unitTitle!),
        actions: [
          UnitModuleCompletedBtn(
            moduleId: widget.moduleId,
            completeBtn: () {},
            unCompleteBtn: () {},
            isCompleted: widget.isCompleted,
            edgeInsets:
                const EdgeInsets.only(left: 20, right: 15, bottom: 5, top: 5),
            margin: const EdgeInsets.all(10),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              fit: FlexFit.loose,
              flex: 2,
              child: Container(
                margin: const EdgeInsets.only(top: 50),
                child: const Text(
                  "Анхааралтай сонсоод\nасуултанд хариулаарай.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 17,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 8,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.6,
                    child: PageView.builder(
                      physics: listenChecks.value[currentIndex].isChecking!
                          ? const AlwaysScrollableScrollPhysics()
                          : const NeverScrollableScrollPhysics(),
                      itemCount: _playlist!.length,
                      onPageChanged: (index) {
                        currentIndex = index;
                        _player.seek(const Duration(seconds: 0), index: index);
                      },
                      controller: controller,
                      itemBuilder: (context, position) {
                        return Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(left: 40),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: cardColors[randomNumbers[position]],
                            ),
                          ),
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            margin: const EdgeInsets.only(bottom: 20, left: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.listeningQuiz!.listening.cue[position]
                                      .title,
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white.withOpacity(0.9)),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 100),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StreamBuilder<PositionData>(
                          stream: _positionDataStream,
                          builder: (context, snapshot) {
                            final positionData = snapshot.data;

                            if (positionData != null &&
                                positionData.position.inMilliseconds ==
                                    uriAudioSource![currentIndex]
                                        .duration!
                                        .inMilliseconds) {
                              currentIndex++;
                              setState(() {
                                
                              });
                            }

                            return SeekBar(
                              duration: positionData?.duration ?? Duration.zero,
                              position: positionData?.position ?? Duration.zero,
                              bufferedPosition:
                                  positionData?.bufferedPosition ??
                                      Duration.zero,
                              onChanged: (Duration duration) async {
                                // print(positionData!.position.inSeconds);
                              },
                              onChangeEnd: _player.seek,
                            );
                          },
                        ),
                        ControlButtons(
                          _player,
                          nextBtn: () {
                            if (currentIndex < _playlist!.length - 1) {
                              currentIndex++;
                              controller.animateToPage(currentIndex,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut);
                            }
                          },
                          previousBtn: () {
                            if (currentIndex > 0) {
                              currentIndex--;
                              controller.animateToPage(currentIndex,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListenCheck {
  int? index;
  bool? isChecking;
  ListenCheck({this.index, this.isChecking});
}
