import 'package:flutter/material.dart';
import 'package:medlegten/pages/CoursePages/base/base_paragraph.dart';
import 'package:medlegten/pages/CoursePages/base/base_video_subtitle.dart';
import 'package:medlegten/pages/CoursePages/base/cue_wrapper.dart';

class ReadingParagraph extends BaseSubtitlePage {
  const ReadingParagraph(
      List<CParagraph> paragraph, SubtitleWordCallback callback,
      {Key? key})
      : super(paragraph, pwordCallback: callback, key: key);

  @override
  _ReadingParagraphState createState() => _ReadingParagraphState();
}

class _ReadingParagraphState extends BaseSubtitleState<ReadingParagraph>
    with BaseSubtitleMixin {}
