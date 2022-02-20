import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/models/Unit/unit_writing_cue.dart';
import 'package:medlegten/models/Unit/unit_writing_cueword.dart';
import 'package:medlegten/utils/global.dart';
import 'package:tuple/tuple.dart';

class WritingParagraph extends StatefulWidget {
  const WritingParagraph(
    this.paragraph,
    this.isSelected,
    this.answers, {
    Key? key,
  }) : super(key: key);

  final UnitWritingCueParagraph paragraph;
  final bool isSelected;
  final Map<UnitWritingCueWord, bool> answers;

  @override
  _WritingParagraphState createState() => _WritingParagraphState();
}

class _WritingParagraphState extends State<WritingParagraph> {
  Map<UnitWritingCueWord, Tuple3<int, TextEditingController, FocusNode>>
      missingList = {};
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    for (var element in missingList.entries) {
      element.value.item2.dispose();
      element.value.item3.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> listWidget = [];
    int i2 = 0;
    for (int i1 = 0; i1 < widget.paragraph.missWords.length; i1++) {
      UnitWritingCueWord word = widget.paragraph.missWords[i1];

      if (word.isVisible == '0') {
        listWidget.add(buildText(
            '${word.mainText}${word.spaceNext == '0' ? ' ' : ''}',
            widget.isSelected));
      } else {
        if (!missingList.containsKey(word)) {
          var _controller = TextEditingController();
          var _focusNode = FocusNode();
          missingList[word] = Tuple3(i2++, _controller, _focusNode);
          _controller.addListener(() {
            if (_controller.value.text.length == word.mainText.length) {
              this.widget.answers[word] =
                  _controller.value.text == word.mainText;
              var nextId = missingList[word]!.item1 + 1;
              for (var element in missingList.values) {
                if (element.item1 == nextId) {
                  element.item3.requestFocus();
                  break;
                }
              }
            }
          });
        }
        var widget = missingText(
            word,
            missingList[word]!.item2,
            missingList[word]!.item3,
            this.widget.isSelected,
            missingList[word]!.item2.value.text.length == word.mainText.length
                ? this.widget.answers[word]
                : null);

        listWidget.add(widget);
      }
    }

    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: listWidget,
    );
  }

  Widget buildText(String text, bool isSelected) {
    //, bool beforeSpace
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'Roboto',
          color: isSelected ? colorBlack : Colors.black45,
          fontSize: 14,
          fontWeight: FontWeight.w400),
    );
  }

  Widget missingText(UnitWritingCueWord word, TextEditingController controller,
      FocusNode focusNode, bool isSelected, bool? isRight) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      height: 25,
      width: textWidth(word.mainText),
      child: TextField(
        focusNode: focusNode,
        maxLength: word.mainText.length,
        textAlignVertical: TextAlignVertical.bottom,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          counter: const Offstage(),
          contentPadding: const EdgeInsets.only(top: 30, bottom: 1),
          enabledBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: getColor(isSelected, isRight), width: 1),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: getColor(isSelected, isRight), width: 1),
          ),
          // border: const UnderlineInputBorder(
          //   borderSide: BorderSide(color: colorPrimary, width: 1),
          // ),
        ),
        controller: controller,
        style: const TextStyle(
            color: colorBlack, fontSize: 15, fontWeight: FontWeight.w400),
      ),
    );
  }

  Color getColor(bool isSelected, bool? isRight) {
    if (isRight == null) {
      return Color.fromRGBO(48, 53, 159, isSelected ? 1 : 0.4);
    } else {
      return isRight
          ? Color.fromRGBO(127, 208, 79, isSelected ? 1 : 0.4)
          : Color.fromRGBO(235, 87, 87, isSelected ? 1 : 0.4);
    }
  }

  double textWidth(String text) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
          text: text,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
      textDirection: TextDirection.ltr,
      textScaleFactor: GlobalValues.screenScaleFactor,
      maxLines: 1,
    )..layout(minWidth: 0, maxWidth: double.infinity);
    double width = textPainter.size.width;

    return width < 80 ? 80 : width;
  }
}