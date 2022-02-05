import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:medlegten/common/colors.dart';
import 'package:audio_session/audio_session.dart';
import 'package:medlegten/pages/CoursePages/Unit_listening/common.dart';
import 'package:medlegten/pages/CoursePages/Unit_listening/control_button.dart';
import 'package:rxdart/rxdart.dart';

class ModuleListenPage extends StatefulWidget {
  const ModuleListenPage({Key? key}) : super(key: key);

  @override
  _ModuleListenPageState createState() => _ModuleListenPageState();
}


class _ModuleListenPageState extends State<ModuleListenPage>
    with WidgetsBindingObserver {
  final PageController controller =
      PageController(viewportFraction: 0.6, initialPage: 0);
  late AudioPlayer _player;
  final _playlist = ConcatenatingAudioSource(children: [
    AudioSource.uri(
      Uri.parse(
          "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3"),
      tag: AudioMetadata(
        album: "Science Friday",
        title: "A Salute To Head-Scratching Science",
        artwork:
            "https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg",
      ),
    ),
  ]);

  @override
  void initState() {
    super.initState();
     WidgetsBinding.instance?.addObserver(this);
     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ));
    _player = AudioPlayer();
    _init();
  }

  ///Аудио тохируулга болон listener
  Future<void> _init() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());

    /// Player ээ сонсож байна
    _player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      print('A stream error occurred: $e');
    });
    try {
      await _player.setAudioSource(_playlist,
          preload: false,initialIndex: 0);
    } catch (e) {
      // Catch load errors: 404, invalid url...
      print("Error loading audio source: $e");
    }
  }

  @override
  void dispose() {
    super.dispose();
    _player.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // _player.stop();
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
      backgroundColor: ColorTable.color255_255_255,
      appBar: AppBar(
        title: const Text("UNIT 2 - Listening"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Listen. Then Answer The Question.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 17,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 60,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.5,
              child: PageView.builder(
                pageSnapping: true,
                padEnds: true,
                controller: controller,
                itemBuilder: (context, position) {
                  return Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 40),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Colors.amber),
                    child: Column(
                      children: [],
                    ),
                  );
                },
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //  StreamBuilder<SequenceState?>(
                //     stream: _player.sequenceStateStream,
                //     builder: (context, snapshot) {
                //       final state = snapshot.data;
                //       if (state?.sequence.isEmpty ?? true) return const SizedBox();
                //       final metadata =
                //           state!.currentSource!.tag as AudioMetadata;
                //       return Column(
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         children: [
                //           // Expanded(
                //           //   child:
                //             Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: Center(
                //                   child: Image.network(metadata.artwork!)),
                //             ),
                //           // ),
                //           Text(metadata.album!,
                //               style: Theme.of(context).textTheme.headline6),
                //           Text(metadata.title!),
                //         ],
                //       );
                //     },
                //   ),
                // Display seek bar. Using StreamBuilder, this widget rebuilds
                // each time the position, buffered position or duration changes.
                StreamBuilder<PositionData>(
                  stream: _positionDataStream,
                  builder: (context, snapshot) {
                    final positionData = snapshot.data;
                    return SeekBar(
                      duration: positionData?.duration ?? Duration.zero,
                      position: positionData?.position ?? Duration.zero,
                      bufferedPosition:
                          positionData?.bufferedPosition ?? Duration.zero,
                      onChangeEnd: _player.seek,
                    );
                  },
                ),
                ControlButtons(_player),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AudioMetadata {
  String? album;
  String? title;
  String? artwork;
  AudioMetadata({this.album, this.title, this.artwork});
}
