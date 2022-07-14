import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:video_player/video_player.dart';

VideoPlayerController useVideoController(String url) {
  return use(
    _VideoPlayerControllerHook(url),
  );
}

class _VideoPlayerControllerHook extends Hook<VideoPlayerController> {
  const _VideoPlayerControllerHook(this.url);

  final String url;

  @override
  HookState<VideoPlayerController, Hook<VideoPlayerController>> createState() =>
      _VideoPlayerControllerHookState();
}

class _VideoPlayerControllerHookState
    extends HookState<VideoPlayerController, _VideoPlayerControllerHook> {
  late VideoPlayerController controller;

  @override
  VideoPlayerController build(BuildContext context) => controller;

  @override
  void initHook() {
    super.initHook();
    controller = hook.url.startsWith('assets')
        ? VideoPlayerController.asset(hook.url)
        : VideoPlayerController.network(hook.url);

    controller
      ..setLooping(false)
      ..initialize().then((value) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          setState(() {
            controller.play();
          });
        });
      });
  }

  @override
  void dispose() => controller.dispose();

  @override
  String get debugLabel => 'useVideoController';
}
