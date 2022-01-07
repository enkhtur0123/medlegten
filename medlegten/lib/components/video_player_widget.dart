
import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController controller;

  const VideoPlayerWidget({Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      controller != null && controller.value.isInitialized
          ? Container(alignment:  Alignment.topCenter, child: buildVideo(),)
          : Container(
              height: 200,
              child: Center(
                child: CircularProgressIndicator(),
              ),
      ) ;

  Widget buildVideo() => Stack(
    children: [
      buildVideoPlayer(),
      Positioned.fill(child: BasicOverlayWidget()),
    ],
  );

  Widget buildVideoPlayer() => AspectRatio(
    aspectRatio: controller.value.aspectRatio,
    child: VideoPlayer(controller),
  );

  Widget BasicOverlayWidget() => GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () => controller.value.isPlaying ? controller.pause() : controller.play(),
    child: Stack(
      children: [
        playButton(),
        Positioned(
          bottom: 0, left: 0, right: 0,
          child: buildIndicator(),
        ),
      ],
    ),
  );
  
  Widget buildIndicator() => VideoProgressIndicator(controller, allowScrubbing: true, );

  Widget playButton() => controller.value.isPlaying
      ? Container()
      : Container(
        alignment: Alignment.center,
        color: Colors.black26,
        child: Icon(Icons.play_arrow, color: colorWhite, size: 80,)
        );
}