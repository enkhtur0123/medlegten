import 'package:flutter/material.dart';

/// A widget that animates implicitly between a play and a pause icon.
class CustomAnimatedPlayPause extends StatefulWidget {
  const CustomAnimatedPlayPause({
    Key? key,
    required this.playing,
    this.size,
    this.color,
  }) : super(key: key);

  final double? size;
  final bool playing;
  final Color? color;

  @override
  State<StatefulWidget> createState() => CustomAnimatedPlayPauseState();
}

class CustomAnimatedPlayPauseState extends State<CustomAnimatedPlayPause>
    with SingleTickerProviderStateMixin {
  late final animationController = AnimationController(
    vsync: this,
    value: widget.playing ? 1 : 0,
    duration: const Duration(milliseconds: 400),
  );

  @override
  void didUpdateWidget(CustomAnimatedPlayPause oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.playing != oldWidget.playing) {
      if (widget.playing) {
        animationController.forward();
      } else {
        animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedIcon(
        color: widget.color,
        size: widget.size,
        icon: AnimatedIcons.play_pause,
        progress: animationController,
      ),
    );
  }
}
