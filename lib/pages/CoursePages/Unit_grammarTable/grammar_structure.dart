import 'package:flutter/material.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/models/Unit/grammar.dart';
import 'package:medlegten/pages/CoursePages/Unit_grammarTable/grammar_helper.dart';
import 'package:medlegten/pages/CoursePages/Unit_grammarTable/grammar_page.dart';

class StructureBody extends StatefulWidget {
  const StructureBody(
      this.grammar, this.helper, this.partLabel, this.partId, this.callback,
      {Key? key})
      : super(key: key);
  final Grammar grammar;
  final Grammarhelper helper;
  final String partLabel;
  final int partId;
  final UnitGrammarCallback callback;

  @override
  _StructureBodyState createState() => _StructureBodyState();
}

class _StructureBodyState extends State<StructureBody> {
  @override
  Widget build(BuildContext context) {
    //var selectedId = ValueNotifier<int>(-1);
    var id = widget.helper.grammarIndex(widget.grammar) + widget.partId;

    var selectedId = widget.helper.selectedChips[id] ?? -1;
    //selectedId.addListener(() {
    //  setState(() {});
    //});

    var selectedNames =
        widget.helper.getPartStructureNames(widget.grammar, widget.partId);

    var allNames =
        widget.helper.getAllPartStructureNames(widget.grammar, widget.partId);

    if (selectedNames.length == 1) {
      //WidgetsBinding.instance?.addPostFrameCallback((_) {
      selectedId = allNames
          .firstWhere((o) => o.answer == selectedNames[0].answer)
          .answerId;
      widget.helper.selectedChips[id] = selectedId;
      widget.helper.selectedAnswers[id] = selectedNames[0].answer;
      //widget.callback(names[0].answer, widget.partId);
      //});
    }

    if (selectedId == -1 && selectedNames.isNotEmpty) {
      selectedId = allNames
          .firstWhere((o) => o.answer == selectedNames[0].answer)
          .answerId;
      widget.helper.selectedChips[id] = selectedId;
      widget.helper.selectedAnswers[id] = selectedNames[0].answer;
    }

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 20,
      children: allNames
          .map(
            (answer) => AbsorbPointer(
              absorbing:
                  widget.partId == 1 ? false : !selectedNames.contains(answer),
              child: GestureDetector(
                onTap: () {
                  selectedId = answer.answerId;
                  widget.helper.selectedChips[id] = selectedId;
                  widget.callback(answer, widget.partId);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: getBorderColor(answer, selectedId)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0))),
                  child: IntrinsicWidth(
                    stepWidth: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                            selectedId == answer.answerId
                                ? Icons.check
                                : Icons.add,
                            color: widget.partId == 1
                                ? const Color.fromRGBO(0, 0, 0, 1)
                                : selectedNames.contains(answer)
                                    ? const Color.fromRGBO(0, 0, 0, 1)
                                    : const Color.fromRGBO(51, 51, 51, .5),
                            size: 15),
                        addHorizontalSpace(5),
                        Text(
                          answer.answer,
                          style: TextStyle(
                              color: widget.partId == 1
                                  ? const Color.fromRGBO(0, 0, 0, 1)
                                  : selectedNames.contains(answer)
                                      ? const Color.fromRGBO(0, 0, 0, 1)
                                      : const Color.fromRGBO(51, 51, 51, .5),
                              fontFamily: 'Roboto',
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Color getBorderColor(GrammarAnswerEx answer, int selectedId) {
    Color color = answer.answerId == selectedId ? Colors.blue : Colors.white;

    return color;
  }
}
