import 'package:flutter/material.dart';
import 'package:medlegten/components/video_player_widget.dart';
import 'package:medlegten/pages/CoursePages/Unit_grammarTable/grammar_helper.dart';
import 'package:video_player/video_player.dart';

class GrammarVideo extends StatefulWidget {
  const GrammarVideo(this.helper, this.callBack, {Key? key}) : super(key: key);

  final Grammarhelper helper;
  final Function callBack;
  @override
  _GrammarVideoState createState() => _GrammarVideoState();
}

class _GrammarVideoState extends State<GrammarVideo> {
  final selectedIndex = [0, 1, 0];
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    _videoPlayerController =
        VideoPlayerController.network(widget.helper.avatarUrl);
    _videoPlayerController
      ..setLooping(false)
      ..initialize().then((value) {
        //WidgetsBinding.instance?.addPostFrameCallback((_) {
        setState(() {
          _videoPlayerController.play();
        });
        //});
      });

    _videoPlayerController.addListener(_listener);

    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  void _listener() {
    if (_videoPlayerController.value.isPlaying) {
      var _duration =
          _videoPlayerController.value.position.inSeconds - selectedIndex[2];
      if (_duration < 0) {
        _duration = _videoPlayerController.value.position.inSeconds;
        selectedIndex[2] = 0;
      }
      var blink = widget.helper.getNextAvatarPart(selectedIndex[1]);
      if (blink > 0 && blink <= _duration) {
        widget.helper.selectedLabelId = selectedIndex[1];
        selectedIndex[1] = selectedIndex[1] + 1;
        //dioRepository.snackBar('At seconds: $blink');
        widget.callBack.call();

        //} else if (blink <= _duration + 2) {
      } else if (widget.helper.selectedLabelId > 0) {
        widget.helper.selectedLabelId = -1;
        widget.callBack.call();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget videoWidget = const SizedBox(
      height: 110,
      width: 1,
    );
    if (_videoPlayerController.value.isInitialized) {
      videoWidget = SizedBox(
          height: 110,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () async {
              if (_videoPlayerController.value.isPlaying) {
                _videoPlayerController.pause();
                selectedIndex[2] =
                    _videoPlayerController.value.position.inSeconds;
              } else {
                _videoPlayerController.seekTo(Duration.zero);
                _videoPlayerController.removeListener(_listener);
                _videoPlayerController.addListener(_listener);
                selectedIndex[1] = 1;
                _videoPlayerController.play();

                widget.callBack.call();
              }
            },
            child: VideoPlayerWidget(
              controller: _videoPlayerController,
              height: 110,
            ),
          ));
    }
    return videoWidget;
  }
}
