import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medlegten/components/chewie_colors.dart';
import 'package:medlegten/components/chewie_video_progressbar.dart';
import 'package:video_player/video_player.dart';

class CustomMaterialVideoProgressBar extends StatelessWidget {
  CustomMaterialVideoProgressBar(
    this.controller, {
    CustomChewieProgressColors? colors,
    this.onDragEnd,
    this.onDragStart,
    this.onDragUpdate,
    Key? key,
  })  : colors = colors ?? CustomChewieProgressColors(),
        super(key: key);

  final VideoPlayerController controller;
  final CustomChewieProgressColors colors;
  final Function()? onDragStart;
  final Function()? onDragEnd;
  final Function()? onDragUpdate;

  @override
  Widget build(BuildContext context) {
    return CustomVideoProgressBar(
      controller,
      barHeight: 2,
      handleHeight: 6,
      drawShadow: false,
      colors: colors,
      onDragEnd: onDragEnd,
      onDragStart: onDragStart,
      onDragUpdate: onDragUpdate,
    );
  }
}
