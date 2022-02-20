import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/models/Unit/unit_conversation_video.dart';
import 'package:medlegten/pages/CoursePages/Unit_conversationVideo/conversation_helper.dart';
import 'package:medlegten/pages/CoursePages/Unit_conversationVideo/conversation_video_subtitle.dart';
import 'package:medlegten/pages/CoursePages/base/base_video_page.dart';
import 'package:medlegten/pages/CoursePages/base/cue_word_widget.dart';
import 'package:medlegten/pages/CoursePages/base/cue_wrapper.dart';

class ConversationVideoPage extends BaseVideoPage {
  const ConversationVideoPage(this.unitConversationVideo, this.url,
      {Key? key, this.moduleId, this.unitTitle, this.isCompleted})
      : super(url, key: key);

  final UnitConversationVideo unitConversationVideo;
  final String url;
  final String? moduleId;
  final String? unitTitle;
  final bool? isCompleted;

  @override
  _ConversationVideoPageState createState() => _ConversationVideoPageState();
}

class _ConversationVideoPageState
    extends BaseVideoPageState<ConversationVideoPage> with BaseVideoMixin {
  CWord? word;
  Rect position = Rect.zero;
  bool bottomIsVisible = false;
  late final ValueNotifier<bool> refreshNotifier = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    videoPlayerController.addListener(() {
      if (videoPlayerController.value.isPlaying && bottomIsVisible) {
        bottomIsVisible = false;
        word = null;
        refreshNotifier.value = !refreshNotifier.value;
      }
    });
  }

  @override
  void dispose() {
    refreshNotifier.dispose();
    super.dispose();
  }

  @override
  Widget subtitleWidget() {
    return ConversationVideoSubtitle(videoPlayerController,
        ConversationVideohelper.convert(widget.unitConversationVideo),
        (cword, pposition) {
      if (cword != null) {
        word = cword;
        position = pposition;
        refreshNotifier.value = !refreshNotifier.value;
      }
    });
  }

  @override
  Widget bottomSheetWidget() {
    return ValueListenableBuilder<bool>(
        builder: (BuildContext context, bool value, Widget? child) {
          return _showBottomSheet(context, word, position);
        },
        valueListenable: refreshNotifier);
  }

  Widget _showBottomSheet(context, CWord? word, Rect position) {
    if (word == null) return const SizedBox(height: 1);
    bottomIsVisible = true;
    return BottomSheet(
      backgroundColor: colorWhite,
      enableDrag: false,
      builder: (BuildContext context) {
        return CueWordWidget(
          word,
          ppointerPosition: position,
          isshadow: false,
        );
      },
      onClosing: () {},
    );
  }
}
