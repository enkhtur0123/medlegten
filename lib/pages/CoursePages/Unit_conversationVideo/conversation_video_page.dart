import 'package:flutter/material.dart';
import 'package:medlegten/models/Unit/unit_introduction_video.dart';
import 'package:medlegten/pages/CoursePages/Unit_conversationVideo/conversation_video_subtitle.dart';
import 'package:medlegten/pages/CoursePages/Unit_introVideo/intro_video_helper.dart';
import 'package:medlegten/pages/CoursePages/base/base_video_page.dart';

class ConversationVideoPage extends BaseVideoPage {
  const ConversationVideoPage(this.unitIntroVideo, this.url, {Key? key})
      : super(url, key: key);

  final UnitIntroVideo unitIntroVideo;
  final String url;

  @override
  _ConversationVideoPageState createState() => _ConversationVideoPageState();
}

class _ConversationVideoPageState
    extends BaseVideoPageState<ConversationVideoPage> with BaseVideoMixin {
  @override
  Widget subtitleWidget() {
    return ConversationVideoSubtitle(
        videoPlayerController, IntroVideohelper.convert(widget.unitIntroVideo));
  }
}
