import 'package:flutter/material.dart';
import 'package:medlegten/models/Unit/unit_writing_cue.dart';
import 'package:video_player/video_player.dart';

class WritingSentencePage extends StatefulWidget {
  const WritingSentencePage(
      this.unitWritingCueParagraph, this.videoPlayerController,
      {Key? key})
      : super(key: key);

  final UnitWritingCueParagraph unitWritingCueParagraph;
  final VideoPlayerController videoPlayerController;
  @override
  _WritingSentencePageState createState() => _WritingSentencePageState();
}

class _WritingSentencePageState extends State<WritingSentencePage> {
  late final ValueNotifier<bool> refreshNotifier = ValueNotifier(false)
    ..addListener(_listener);

  void _listener() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    refreshNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
