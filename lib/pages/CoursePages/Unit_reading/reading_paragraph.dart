import 'package:flutter/material.dart';
import 'package:medlegten/pages/CoursePages/base/base_paragraph.dart';
import 'package:medlegten/pages/CoursePages/base/cue_wrapper.dart';

class ReadingParagraph extends BaseSubtitlePage {
  const ReadingParagraph(CParagraph paragraph, SubtitleWordCallback callback,
      SubtitleParagraphCallback paragraphCallback, {Key? key})
      : super(paragraph,
            pwordCallback: callback,
            pparagraphCallback: paragraphCallback,
            key: key);

  @override
  _ReadingParagraphState createState() => _ReadingParagraphState();
}

class _ReadingParagraphState extends BaseSubtitleState<ReadingParagraph>
    with BaseSubtitleMixin {}
