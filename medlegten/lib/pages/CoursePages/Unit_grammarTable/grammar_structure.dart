import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/models/Unit/grammar.dart';
import 'package:medlegten/pages/CoursePages/Unit_grammarTable/grammar_helper.dart';
import 'package:medlegten/pages/CoursePages/Unit_grammarTable/module_grammar_table.dart';
import 'package:tuple/tuple.dart';

class StructureBody extends HookWidget {
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
  Widget build(BuildContext context) {
    var selectedId = useState(
        helper.selectedChips[Tuple2<Grammar, int>(grammar, partId)] ?? -1);
    var names =
        helper.getPartStructureNames(grammar, partId, helper.selectedAnswers);
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 20,
      children: names
          .map((answer) => ChoiceChip(
                backgroundColor: ColorTable.color255_255_255,
                selectedColor: ColorTable.color255_255_255,
                elevation: answer.answerId == selectedId.value ? 5.0 : 0.0,
                shape: RoundedRectangleBorder(
                    side: getBorderSide(answer, selectedId.value),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(20.0))),
                label: IntrinsicWidth(
                  stepWidth: 50,
                  child: Center(
                    child: Text(answer.answer,
                        style: const TextStyle(
                            color: Color.fromRGBO(51, 51, 51, 1),
                            fontFamily: 'Roboto',
                            fontSize: 15,
                            fontWeight: FontWeight.w400)),
                  ),
                ),
                onSelected: (bool selected) {
                  selectedId.value = selected ? answer.answerId : 0;
                  helper.selectedChips[Tuple2<Grammar, int>(grammar, partId)] =
                      selectedId.value;
                  callback(answer.answer, partId);
                },
                selected: answer.answerId == selectedId.value,
              ))
          .toList(),
    );
  }

  BorderSide getBorderSide(GrammarAnswerEx answer, int selectedId) {
    Color color = answer.answerId == selectedId ? Colors.blue : Colors.white;

    return BorderSide(color: color);
  }
}
