import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:medlegten/components/loading.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerChewie extends StatefulWidget {
  final VideoPlayerController videoPlayerController;

  const VideoPlayerChewie(
    this.videoPlayerController, {
    Key? key,
  }) : super(key: key);

  @override
  _VideoPlayerChewieState createState() => _VideoPlayerChewieState();
}

class _VideoPlayerChewieState extends State<VideoPlayerChewie> {
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();

    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: 16 / 9,
      allowFullScreen: false,
      allowMuting: false,
      showOptions: false,
      allowPlaybackSpeedChanging: false,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
      // subtitle: Subtitles([
      //   Subtitle(
      //     index: 0,
      //     start: Duration.zero,
      //     end: const Duration(seconds: 10),
      //     text: 'Hello from subtitles',
      //   ),
      //   Subtitle(
      //     index: 1,
      //     start: const Duration(seconds: 10),
      //     end: const Duration(seconds: 20),
      //     text: 'Whats up? :)',
      //   ),
      // ]),
      // subtitleBuilder: (context, subtitle) => Positioned(
      //   top: 200,
      //   left: 100,
      //   child: Text(
      //     subtitle,
      //     style: const TextStyle(color: Colors.white),
      //   ),
      // ),
    );
  }

  @override
  void dispose() {
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: _chewieController.videoPlayerController.value.isInitialized
          ? Chewie(
              controller: _chewieController,
            )
          : const Loading(),
    );
  }
}
