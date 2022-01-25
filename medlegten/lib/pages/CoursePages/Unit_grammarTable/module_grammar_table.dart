import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/components/landing_header.dart';
import 'package:medlegten/models/Unit/grammar.dart';
import 'package:medlegten/models/Unit/unit_grammar.dart';
import 'package:medlegten/pages/CoursePages/Unit_grammarTable/grammar_helper.dart';
import 'package:medlegten/pages/CoursePages/Unit_grammarTable/grammar_structure.dart';

typedef UnitGrammarCallback = void Function(String val, int level);

class ModuleGrammarTablePage extends HookWidget {
  const ModuleGrammarTablePage(this.unitGrammar, {Key? key}) : super(key: key);

  final UnitGrammar unitGrammar;

  @override
  Widget build(BuildContext context) {
    List<Tab> tabs = [];
    for (var element in unitGrammar.grammar) {
      tabs.add(Tab(text: element.label));
    }

    final _controller = useTabController(initialLength: tabs.length);
    final notifier = useState(false);
    final helper = useMemoized(() => Grammarhelper(unitGrammar));
    _controller.addListener(() {
      notifier.value = !notifier.value;
    });
    return Scaffold(
      backgroundColor: ColorTable.color255_255_255,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LandingHeader(100),
            addVerticalSpace(20),
            Text(
              unitGrammar.label.toUpperCase(),
              style: const TextStyle(
                  color: colorPrimary,
                  fontWeight: FontWeight.w700,
                  fontSize: 14),
            ),
            addVerticalSpace(20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Жишээ:',
                style: TextStyle(
                    color: colorPrimary,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
            ),
            addVerticalSpace(20),
            ValueListenableBuilder<bool>(
              builder: (BuildContext context, bool value, Widget? child) {
                return child!;
              },
              valueListenable: notifier,
              child: Text(
                helper
                    .getSentence(unitGrammar.grammar[_controller.index],
                        helper.selectedAnswers)
                    .eng,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: colorBlack,
                    fontWeight: FontWeight.w400,
                    fontSize: 17),
              ),
            ),
            addVerticalSpace(20),
            ValueListenableBuilder<bool>(
              builder: (BuildContext context, bool value, Widget? child) {
                return child!;
              },
              valueListenable: notifier,
              child: Text(
                helper
                    .getSentence(unitGrammar.grammar[_controller.index],
                        helper.selectedAnswers)
                    .mon,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Color.fromRGBO(168, 175, 229, 1),
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    fontStyle: FontStyle.italic),
              ),
            ),
            addVerticalSpace(25),
            const Divider(
              color: Color.fromRGBO(199, 201, 217, 0.2),
              thickness: 1,
            ),
            addVerticalSpace(10),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Өгүүлбэрийн төрөл сонгох',
                style: TextStyle(
                  color: colorPrimary,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: TabBar(
                isScrollable: false,
                unselectedLabelColor: Colors.black,
                labelColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.tab,
                padding: const EdgeInsets.all(10),
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      20.0,
                    ),
                    border: Border.all(color: Colors.blueAccent),
                    color: Colors.white),
                tabs: tabs,
                controller: _controller,
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _controller,
                children: unitGrammar.grammar
                    .map((grammar) =>
                        buildTabview(grammar, helper, (val, level) {
                          helper.valueKeyList.forEach((key, value) {
                            var prefixNum = helper.grammarIndex(grammar);
                            if (key > level + prefixNum &&
                                key - prefixNum < 10000) {
                              helper.valueKeyList[key] = value + 1;
                            }
                          });
                          if (level == 1) {
                            helper.selectedAnswers = {};
                          }
                          helper.selectedAnswers[level] = val;
                          helper.selectedGrammar = grammar;
                          notifier.value = !notifier.value;
                        }))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTabview(
    Grammar grammar,
    Grammarhelper helper,
    Function(String val, int level) callBack,
  ) {
    List<Widget> list = [];

    for (int i = 1; i < 11; i++) {
      if (grammar.structure.getPart(i) != null) {
        list.addAll(buildStructure(
          grammar,
          helper,
          grammar.structure.getPart(i)!,
          i,
          callBack,
        ));
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: list,
      ),
    );
  }

  List<Widget> buildStructure(
    Grammar grammar,
    Grammarhelper helper,
    String partLabel,
    int partId,
    Function(String val, int level) callBack,
  ) {
    var key = helper.grammarIndex(grammar) + partId;
    if (!helper.valueKeyList.containsKey(key)) {
      helper.valueKeyList[key] = key;
    }

    return [
      buildStructureLabel(partLabel),
      StructureBody(grammar, helper, partLabel, partId, (val, level) {
        callBack.call(val, level);
      }, key: ValueKey<int>(helper.valueKeyList[key]!))
    ];
  }

  Widget buildStructureLabel(String partLabel) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Chip(
        backgroundColor: ColorTable.color255_255_255,
        elevation: 0.0,
        shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.white38),
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        label: IntrinsicWidth(
          stepWidth: 50,
          child: Center(
            child: Text(partLabel,
                style: const TextStyle(
                    color: Color.fromRGBO(51, 51, 51, 1),
                    fontFamily: 'Roboto',
                    fontSize: 15,
                    fontWeight: FontWeight.w400)),
          ),
        ),
      ),
    );
  }
}
