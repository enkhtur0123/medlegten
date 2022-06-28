import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final VideoPlayerController controller;
  final double height;

  const VideoPlayerWidget(
      {Key? key, required this.controller, required this.height})
      : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  @override
  Widget build(BuildContext context) => SizedBox(
        height: widget.height,
        child: widget.controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: widget.controller.value.aspectRatio,
                child: VideoPlayer(widget.controller),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      );

  // Widget buildVideo() => Stack(
  //       children: [
  //         ,
  //         //Positioned.fill(child: basicOverlayWidget()),
  //       ],
  //     );

  //Widget basicOverlayWidget() => ;

  Widget playButton() => widget.controller.value.isPlaying
      ? Container()
      : Container(
          alignment: Alignment.center,
          color: Colors.black26,
          child: const Icon(
            Icons.play_arrow,
            color: colorWhite,
            size: 40,
          ),
        );
}
