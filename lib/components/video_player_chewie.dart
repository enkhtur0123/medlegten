import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/components/chewie_custom_controls.dart';
import 'package:medlegten/components/loading.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerChewie extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final double aspectRatio;
  final bool? autoPlay;

  const VideoPlayerChewie(
    this.videoPlayerController, {
    this.aspectRatio = 16 / 9,
    this.autoPlay=true,
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
      aspectRatio: widget.videoPlayerController.value.aspectRatio,
      allowFullScreen: false,
      allowMuting: false,
      showControls: true,
      showControlsOnInitialize: false,
      customControls: const ChewieCustomControls(),
      autoInitialize: false,
      // showOptions: false,
      allowPlaybackSpeedChanging: true,
      overlay: null,
      autoPlay: false,
      placeholder: Container(
        color: Colors.white,
        child: const Center(
          child: Icon(Icons.videocam, size: 35.0, color: colorPrimary),
        ),
      ),
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: const TextStyle(color: Colors.red),
          ),
        );
      },
    );
    if(!widget.autoPlay!){
      _chewieController.pause();
    }
   
  }

  @override
  void dispose() {
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widget.videoPlayerController.value.aspectRatio,
      child: Container(
        color: Colors.black45,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            if (!widget.videoPlayerController.value.isPlaying) {
              widget.videoPlayerController.play();
            } else {
              widget.videoPlayerController.pause();
            }
          },
          child: _chewieController.videoPlayerController.value.isInitialized
              ? Chewie(
                  controller: _chewieController,
                )
              : const Loading(),
        ),
      ),
    );
  }
}
