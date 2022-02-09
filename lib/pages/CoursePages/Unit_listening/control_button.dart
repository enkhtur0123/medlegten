import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:medlegten/themes/style.dart';

class ControlButtons extends StatelessWidget {
  final AudioPlayer player;
  VoidCallback? previousBtn;
  VoidCallback? nextBtn;

  ControlButtons(this.player, {Key? key, this.nextBtn, this.previousBtn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        StreamBuilder<SequenceState?>(
          stream: player.sequenceStateStream,
          builder: (context, snapshot) => IconButton(
            icon: const Icon(
              Icons.skip_previous,
              size: 50,
              color: secondaryColor,
            ),
            onPressed: () {
              previousBtn!();
            },
          ),
        ),
        StreamBuilder<PlayerState>(
          stream: player.playerStateStream,
          builder: (context, snapshot) {
            final playerState = snapshot.data;
            final processingState = playerState?.processingState;
            final playing = playerState?.playing;
            if (processingState == ProcessingState.loading ||
                processingState == ProcessingState.buffering) {
              return Container(
                margin: const EdgeInsets.all(8.0),
                width: 64.0,
                height: 64.0,
                child: const CircularProgressIndicator(),
              );
            } else if (playing != true) {
              return Container(
                  decoration: getDecoration(),
                  child: IconButton(
                    icon: const Icon(
                      Icons.play_arrow,
                      color: secondaryColor,
                    ),
                    iconSize: 50.0,
                    onPressed: player.play,
                  ));
            } else if (processingState != ProcessingState.completed) {
              return Container(
                  decoration: getDecoration(),
                  child: IconButton(
                    icon: const Icon(Icons.pause, color: secondaryColor),
                    iconSize: 50.0,
                    onPressed: player.pause,
                  ));
            } else {
              return IconButton(
                icon: const Icon(
                  Icons.replay,
                  color: secondaryColor,
                ),
                iconSize: 50.0,
                onPressed: () => player.seek(Duration.zero),
              );
            }
          },
        ),
        StreamBuilder<SequenceState?>(
          stream: player.sequenceStateStream,
          builder: (context, snapshot) => IconButton(
            icon: const Icon(
              Icons.skip_next,
              size: 50,
              color: secondaryColor,
            ),
            onPressed: () {
              nextBtn!();
            },
          ),
        ),
      ],
    );
  }

  BoxDecoration getDecoration() {
    return BoxDecoration(
      shape: BoxShape.circle,
      color: const Color(0xffF4F4F4),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3), // changes position of shadow
        ),
      ],
    );
  }
}
