import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/pages/CoursePages/base/clip_shadow.dart';
import 'package:medlegten/pages/CoursePages/base/cue_wrapper.dart';
import 'package:medlegten/pages/CoursePages/base/message.dart';

class ArticleTranslate extends StatefulWidget {
  const ArticleTranslate(this.paragraph, {Key? key}) : super(key: key);

  final CParagraph paragraph;
  @override
  _ArticleTranslateState createState() => _ArticleTranslateState();
}

class _ArticleTranslateState extends State<ArticleTranslate> {
  final left = 20.0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Message(
        triangleX1: left + 22, //0.4 * messageBoxWidth,
        triangleX2: left, //0.5 * messageBoxWidth,
        triangleX3: left + 11, //0.5 * messageBoxWidth,
        triangleY1: 12, // cueWidgetHeight * 0.2,
        clipShadows: [ClipShadow(color: Colors.grey.withOpacity(0.8))],
        isTop: true,
        isShadow: false,
        child: Expanded(
          //key: _textKey,
          //height: textSize.height,
          //width: textSize.width,
          child: innerWidget(),
        ),
      ),
    );
  }

  Widget innerWidget() {
    List<Widget> list = [];

    list.add(const Text(
      'Монгол орчуулга',
      style: TextStyle(
          fontFamily: 'Roboto',
          color: colorPrimary,
          fontSize: 14,
          fontWeight: FontWeight.w500),
    ));
    list.add(addVerticalSpace(3));
    list.add(Text(
      widget.paragraph.monText,
      style: const TextStyle(
          fontFamily: 'Roboto',
          color: Color.fromRGBO(79, 79, 79, 1),
          fontSize: 12,
          fontWeight: FontWeight.w400),
    ));
    list.add(addVerticalSpace(10));

    return Container(
      //color: Colors.amber,
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: list,
      ),
    );
  }
}
