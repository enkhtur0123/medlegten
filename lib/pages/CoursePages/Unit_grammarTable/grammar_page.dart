import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/components/video_player_widget.dart';
import 'package:medlegten/models/Unit/grammar.dart';
import 'package:medlegten/models/Unit/unit_grammar.dart';
import 'package:medlegten/pages/CoursePages/Unit_grammarTable/blink.dart';
import 'package:medlegten/pages/CoursePages/Unit_grammarTable/grammar_helper.dart';
import 'package:medlegten/pages/CoursePages/Unit_grammarTable/grammar_structure.dart';
import 'package:medlegten/pages/CoursePages/unit/unit_module_completed_btn.dart';
import 'package:medlegten/utils/global.dart';
import 'package:tuple/tuple.dart';
import 'package:video_player/video_player.dart';

typedef UnitGrammarCallback = void Function(GrammarAnswerEx asnwer, int level);

class GrammarTablePage extends StatefulWidget {
  const GrammarTablePage(this.unitGrammar, {Key? key,this.moduleId}) : super(key: key);

  final UnitGrammar unitGrammar;
  final String? moduleId;
  @override
  _GrammarTablePageState createState() => _GrammarTablePageState();
}

class _GrammarTablePageState extends State<GrammarTablePage>
    with SingleTickerProviderStateMixin {
  late final Grammarhelper helper = Grammarhelper(widget.unitGrammar);
  late final refreshView = ValueNotifier<bool>(false)
    ..addListener(() {
      setState(() {});
    });
  final selectedIndex = [0, 1, 0];
  late TabController _controller;
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    _controller =
        TabController(length: widget.unitGrammar.grammar.length, vsync: this);
    _videoPlayerController = VideoPlayerController.network(helper.avatarUrl);

    _videoPlayerController
      ..setLooping(false)
      ..initialize().then((value) {
        //WidgetsBinding.instance?.addPostFrameCallback((_) {
        setState(() {
          _videoPlayerController.play();
        });
        //});
      });

    _videoPlayerController.addListener(_listener);

    helper.selectedGrammar = widget.unitGrammar.grammar[0];

    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _listener() {
    if (_videoPlayerController.value.isPlaying) {
      var _duration =
          _videoPlayerController.value.position.inSeconds - selectedIndex[2];
      if (_duration < 0) {
        _duration = _videoPlayerController.value.position.inSeconds;
        selectedIndex[2] = 0;
      }
      var blink = helper.getNextAvatarPart(selectedIndex[1]);
      if (blink <= _duration) {
        helper.selectedLabelId = selectedIndex[1];
        selectedIndex[1] = selectedIndex[1] + 1;
        //dioRepository.snackBar('At seconds: $blink');
        refreshView.value = !refreshView.value;
      } else if (helper.selectedLabelId > 0) {
        helper.selectedLabelId = -1;
        refreshView.value = !refreshView.value;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget videoWidget = const SizedBox(
      height: 110,
      width: 1,
    );
    if (_videoPlayerController.value.isInitialized) {
      videoWidget = SizedBox(
          height: 110,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () async {
              if (_videoPlayerController.value.isPlaying) {
                _videoPlayerController.pause();
                selectedIndex[2] =
                    _videoPlayerController.value.position.inSeconds;
              } else {
                _videoPlayerController.seekTo(Duration.zero);
                _videoPlayerController.removeListener(_listener);
                _videoPlayerController.addListener(_listener);
                selectedIndex[1] = 1;
                _videoPlayerController.play();
                refreshView.value = !refreshView.value;
              }
            },
            child: VideoPlayerWidget(
              controller: _videoPlayerController,
              height: 110,
            ),
          ));
    }
    return Scaffold(
      appBar: AppBar(
        actions: [
          UnitModuleCompletedBtn(
            moduleId: widget.moduleId,
            completeBtn: () {},
            unCompleteBtn: () {},
          )
        ],
      ),
      backgroundColor: ColorTable.color255_255_255,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            addVerticalSpace(20),
            videoWidget,
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
            Text(
              helper
                  .getSentence(widget.unitGrammar.grammar[_controller.index])
                  .textEng,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: colorBlack, fontWeight: FontWeight.w400, fontSize: 17),
            ),
            addVerticalSpace(20),
            Text(
              helper
                  .getSentence(widget.unitGrammar.grammar[_controller.index])
                  .textMon,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Color.fromRGBO(168, 175, 229, 1),
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  fontStyle: FontStyle.italic),
            ),
            addVerticalSpace(20),
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
                  fontFamily: 'Roboto',
                  color: colorPrimary,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SizedBox(
                width: double.infinity,
                height: 35,
                child: TabBar(
                  isScrollable: false,
                  unselectedLabelColor: Colors.black,
                  labelColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: Colors.transparent,
                  tabs: [
                    Tab(
                      child: _buildTab(
                          text: widget.unitGrammar.grammar[0].label,
                          isSelected: selectedIndex[0] == 0),
                    ),
                    Tab(
                      child: _buildTab(
                          text: widget.unitGrammar.grammar[1].label,
                          isSelected: selectedIndex[0] == 1),
                    ),
                    Tab(
                      child: _buildTab(
                          text: widget.unitGrammar.grammar[2].label,
                          isSelected: selectedIndex[0] == 2),
                    ),
                  ],
                  controller: _controller,
                  onTap: (index) {
                    selectedIndex[0] = index;
                    refreshView.value = !refreshView.value;
                  },
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: buildTabview(
                widget.unitGrammar.grammar[selectedIndex[0]],
                helper,
                (answer, level) {
                  var id = helper.grammarIndex(
                          widget.unitGrammar.grammar[selectedIndex[0]]) +
                      level;
                  if (level == 1 &&
                      helper.selectedGrammar ==
                          widget.unitGrammar.grammar[selectedIndex[0]]) {
                    helper.selectedAnswers = {};
                    helper.selectedChips = {};
                  }

                  if (helper.selectedAnswers[id] != answer.answer) {
                    helper.selectedAnswers[id] = answer.answer;
                    helper.selectedChips[id] = answer.answerId;
                    helper.selectedGrammar =
                        widget.unitGrammar.grammar[selectedIndex[0]];
                    refreshView.value = !refreshView.value;
                  }
                },
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
    UnitGrammarCallback callBack,
  ) {
    List<Widget> list = [];

    for (int i = 1; i < 7; i++) {
      if (grammar.getPart(i) != null) {
        list.addAll(
            buildStructure(grammar, helper, grammar.getPart(i)!, i, callBack));
      }
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return list[index];
      },
    );
  }

  List<Widget> buildStructure(Grammar grammar, Grammarhelper helper,
      String partLabel, int partId, UnitGrammarCallback callBack) {
    return [
      buildStructureLabel(
          partLabel, grammar, partId, partId == helper.selectedLabelId),
      Padding(
        padding: EdgeInsets.only(
            left: (grammar.getPartCount() - 1 == partId ? 10 : 25), right: 10),
        child: Container(
          width: GlobalValues.screenWidth - 20,
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: grammar.getPartCount() - 1 == partId
                    ? Colors.transparent
                    : const Color.fromRGBO(199, 201, 217, .5),
                width: grammar.getPartCount() - 1 == partId ? 0 : 1,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: StructureBody(
              grammar,
              helper,
              partLabel,
              partId,
              (val, level) {
                callBack.call(val, level);
              },
            ),
          ),
        ),
      ),
    ];
  }

  Widget buildStructureLabel(
      String partLabel, Grammar grammar, int labelIndex, bool isLight) {
    final globalKey = GlobalKey();
    var widget = Align(
      key: globalKey,
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        decoration: BoxDecoration(
            border: Border.all(
                color: isLight
                    ? const Color.fromRGBO(51, 51, 51, 1)
                    : const Color.fromRGBO(199, 201, 217, .5)),
            borderRadius: const BorderRadius.all(Radius.circular(20.0))),
        child: isLight
            ? BlinkWidget([
                Text(
                  partLabel,
                  style: const TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Roboto',
                      fontSize: 18,
                      fontWeight: FontWeight.w800),
                ),
                Text(
                  partLabel,
                  style: const TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                )
              ])
            : Text(
                partLabel,
                style: const TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
      ),
    );
    helper.labelWidgets[Tuple2<Grammar, int>(grammar, labelIndex)] = globalKey;
    return widget;
  }

  _buildTab({required String text, required bool isSelected}) {
    return isSelected
        ? PhysicalModel(
            color: Colors.white,
            elevation: 2,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: GlobalValues.getWidthRelativeToScreen(30),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color.fromRGBO(120, 100, 254, 1),
                  ),
                  color: const Color.fromRGBO(255, 255, 255, 1)),
              //color: color,
              child: Text(text),
            ))
        : PhysicalModel(
            color: Colors.white,
            elevation: 2,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: GlobalValues.getWidthRelativeToScreen(30),
              alignment: Alignment.center,
              child: Text(text),
            ),
          );
  }
}
