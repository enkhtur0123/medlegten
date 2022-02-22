import 'package:flutter/material.dart';
import 'package:medlegten/pages/CoursePages/base/base_paragraph.dart';
import 'package:medlegten/pages/CoursePages/base/cue_wrapper.dart';

class ReadingParagraph extends BaseSubtitlePage {
  const ReadingParagraph(
      CParagraph paragraph,
      SubtitleWordCallback callback,
      SubtitleParagraphCallback paragraphCallback,
      Widget tailWidget,
      SubtitleParagraphCallback tailcallback,
      bool selectParagraph,
      Color defaultColor,
      {Key? key})
      : super(paragraph,
            pwordCallback: callback,
            pparagraphCallback: paragraphCallback,
            key: key,
            ptailWidget: tailWidget,
            ptailCallback: tailcallback,
            pselectedParagraph: selectParagraph,
            pdefaultColor: defaultColor);

  @override
  _ReadingParagraphState createState() => _ReadingParagraphState();
}

class _ReadingParagraphState extends BaseSubtitleState<ReadingParagraph>
    with BaseSubtitleMixin {}
