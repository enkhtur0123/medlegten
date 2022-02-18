import 'package:flutter/material.dart';
import 'package:medlegten/models/Unit/unit_conversation_video.dart';
import 'package:medlegten/pages/CoursePages/Unit_conversationVideo/conversation_helper.dart';
import 'package:medlegten/pages/CoursePages/Unit_conversationVideo/conversation_video_subtitle.dart';
import 'package:medlegten/pages/CoursePages/base/base_video_page.dart';

class ConversationVideoPage extends BaseVideoPage {
  const ConversationVideoPage(this.unitConversationVideo, this.url,
      {Key? key, this.moduleId, this.unitTitle,this.isCompleted})
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
  @override
  Widget subtitleWidget() {
    return ConversationVideoSubtitle(videoPlayerController!,
        ConversationVideohelper.convert(widget.unitConversationVideo));
  }
}
