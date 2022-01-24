import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/components/landing_header.dart';
import 'package:medlegten/models/Unit/grammar.dart';
import 'package:medlegten/models/Unit/unit_grammar.dart';
import 'package:medlegten/pages/CoursePages/Unit_grammarTable/grammar_helper.dart';
import 'package:medlegten/pages/CoursePages/Unit_grammarTable/grammar_structure.dart';

typedef UnitGrammarCallback = void Function(String val);

String partName = '';

class ModuleGrammarTablePage extends HookWidget {
  const ModuleGrammarTablePage(this.unitGrammar, {Key? key}) : super(key: key);

  final UnitGrammar unitGrammar;

  @override
  Widget build(BuildContext context) {
    final modelNotifier = useState(false);
    List<Tab> tabs = [];
    Grammarhelper helper = Grammarhelper(unitGrammar);

    for (var element in unitGrammar.grammar) {
      tabs.add(Tab(text: element.label));
    }
    //final state = useState(false);
    final _controller = useTabController(initialLength: tabs.length);
    final valueKeyList = useMemoized(() => <Grammar, int>{});

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
            Text(
              unitGrammar.tosentence,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: colorBlack, fontWeight: FontWeight.w400, fontSize: 17),
            ),
            addVerticalSpace(20),
            Text(
              unitGrammar.fromsentence,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Color.fromRGBO(168, 175, 229, 1),
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  fontStyle: FontStyle.italic),
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
            TabBar(
              isScrollable: false,
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: const BubbleTabIndicator(
                indicatorHeight: 30.0,
                indicatorColor: Colors.blueAccent,
                tabBarIndicatorSize: TabBarIndicatorSize.tab,

                // Other flags
                // indicatorRadius: 1,
                // insets: EdgeInsets.all(1),
                // padding: EdgeInsets.all(10)
              ),
              tabs: tabs,
              controller: _controller,
            ),
            Expanded(
              child: ValueListenableBuilder<bool>(
                builder: (BuildContext context, bool value, Widget? child) {
                  return child!;
                },
                valueListenable: modelNotifier,
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _controller,
                  children: unitGrammar.grammar
                      .map((grammar) => buildTabview(grammar, helper, (val) {
                            modelNotifier.value != modelNotifier.value;
                            print(val);
                            partName = val;
                          }))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTabview(
      Grammar grammar, Grammarhelper helper, Function(String val) callBack) {
    List<Widget> list = [];
    if (grammar.structure.part1 != null) {
      list.addAll(buildStructure(
          grammar, helper, grammar.structure.part1!, 1, partName, callBack));
    }
    if (grammar.structure.part2 != null) {
      list.addAll(buildStructure(
          grammar, helper, grammar.structure.part2!, 2, partName, callBack));
    }
    if (grammar.structure.part3 != null) {
      list.addAll(buildStructure(
          grammar, helper, grammar.structure.part3!, 3, partName, callBack));
    }
    // if (grammar.structure.part4 != null) {
    //   list.addAll(buildStructure(grammar, helper, grammar.structure.part4!));
    // }
    // if (grammar.structure.part5 != null) {
    //   list.addAll(buildStructure(grammar, helper, grammar.structure.part5!));
    // }
    // if (grammar.structure.part6 != null) {
    //   list.addAll(buildStructure(grammar, helper, grammar.structure.part6!));
    // }
    // if (grammar.structure.part7 != null) {
    //   list.addAll(buildStructure(grammar, helper, grammar.structure.part7!));
    // }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: list,
      ),
    );

    //Text(grammar.label, style: const TextStyle(color: Colors.black));
  }

  List<Widget> buildStructure(
      Grammar grammar,
      Grammarhelper helper,
      String partLabel,
      int partId,
      String partNames,
      Function(String val) callBack) {
    return [
      buildStructureLabel(partLabel),
      StructureBody(grammar, helper, partLabel, partId, (val) {
        callBack.call(val);
      }, partname: partNames)
    ];
  }

  Widget buildStructureLabel(String partLabel) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        partLabel,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
