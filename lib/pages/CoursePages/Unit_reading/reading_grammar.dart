import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/pages/CoursePages/base/cue_wrapper.dart';
import 'package:medlegten/pages/CoursePages/base/message.dart';
import '../base/clip_shadow.dart';

class ReadingGrammar extends StatefulWidget {
  const ReadingGrammar(this.paragraph, {Key? key}) : super(key: key);

  final CParagraph paragraph;
  @override
  _ReadingGrammarState createState() => _ReadingGrammarState();
}

class _ReadingGrammarState extends State<ReadingGrammar> {
  //final GlobalKey _textKey = GlobalKey();
  final left = 20.0;
  //late Size textSize = Size(GlobalValues.screenWidth - 40, 150);
  @override
  void initState() {
    super.initState();
    //WidgetsBinding.instance?.addPostFrameCallback((_) => getSizeAndPosition());
  }

  getSizeAndPosition() {
    //var rect = _textKey.globalPaintBounds;
    //textSize = Size(rect!.size.width, rect.size.height + 20);
    //setState(() {});
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
        child: innerWidget(),
        //Expanded(
        //key: _textKey,
        //height: textSize.height,
        //width: textSize.width,
        //child: innerWidget(),
        //),
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
    list.add(addVerticalSpace(8));
    list.add(Text(
      widget.paragraph.monText,
      style: const TextStyle(
          fontFamily: 'Roboto',
          color: Color.fromRGBO(79, 79, 79, 1),
          fontSize: 12,
          fontWeight: FontWeight.w400),
    ));
    list.add(addVerticalSpace(20));
    if (widget.paragraph.grammarIsHighLighted == '1') {
      list.add(const Text(
        'Дүрмийн тайлбар',
        style: TextStyle(
            fontFamily: 'Roboto',
            color: colorPrimary,
            fontSize: 14,
            fontWeight: FontWeight.w500),
      ));
      list.add(addVerticalSpace(8));
      list.add(Text(
        widget.paragraph.grammarDescription!,
        style: const TextStyle(
            fontFamily: 'Roboto',
            color: Color.fromRGBO(120, 100, 254, 1),
            fontSize: 12,
            fontWeight: FontWeight.w500),
      ));
    }
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
