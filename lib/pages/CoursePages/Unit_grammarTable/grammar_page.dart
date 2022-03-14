import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/components/video_player_widget.dart';
import 'package:medlegten/models/Unit/grammar.dart';
import 'package:medlegten/models/Unit/unit_grammar.dart';
import 'package:medlegten/pages/CoursePages/Unit_grammarTable/blink.dart';
import 'package:medlegten/pages/CoursePages/Unit_grammarTable/grammar_helper.dart';
import 'package:medlegten/pages/CoursePages/Unit_grammarTable/grammar_structure.dart';
import 'package:medlegten/pages/CoursePages/base/unit_appbar.dart';
import 'package:medlegten/utils/global.dart';
import 'package:tuple/tuple.dart';
import 'package:video_player/video_player.dart';

typedef UnitGrammarCallback = void Function(GrammarAnswerEx asnwer, int level);

class GrammarTablePage extends StatefulWidget {
  const GrammarTablePage(this.unitGrammar,
      {Key? key, this.moduleId, this.unitTitle, this.isCompleted})
      : super(key: key);

  final UnitGrammar unitGrammar;
  final String? moduleId;
  final String? unitTitle;
  final bool? isCompleted;
  @override
  _GrammarTablePageState createState() => _GrammarTablePageState();
}

class _GrammarTablePageState extends State<GrammarTablePage>
    with SingleTickerProviderStateMixin {
  late final Grammarhelper helper = Grammarhelper(
      widget.unitGrammar, widget.unitGrammar.grammar[0].label == 'Types');
  late final refreshView = ValueNotifier<bool>(false)
    ..addListener(() {
      setState(() {});
    });
  final selectedIndex = [0, 1, 0];
  late TabController _controller;
  late VideoPlayerController _videoPlayerController;
  bool isType1 = false;
  @override
  void initState() {
    isType1 = widget.unitGrammar.grammar[0].label == 'Types';

    _controller =
        TabController(length: widget.unitGrammar.grammar.length, vsync: this);
    _videoPlayerController = VideoPlayerController.network(helper.avatarUrl);
    //qVideoPlayerController.asset('assets/A1-U1-INTRO.mp4');
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
        //} else if (blink <= _duration + 2) {
      } else if (helper.selectedLabelId > 0) {
        helper.selectedLabelId = -1;
        refreshView.value = !refreshView.value;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTable.color255_255_255,
      body: Stack(children: [
        Positioned(
          top: unitHeaderHeight,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - unitHeaderHeight,
          child: body(),
        ),
        Positioned(
          width: MediaQuery.of(context).size.width,
          height: unitHeaderHeight + 8,
          child: UnitAppBar(
            widget.unitTitle!,
            moduleId: widget.moduleId,
            isCompleted: widget.isCompleted,
          ),
        ),
      ]),
    );
  }

  Widget body() {
    List<Tab> tabs = [];
    for (int i = 0; i < widget.unitGrammar.grammar.length; i++) {
      tabs.add(Tab(
        child: _buildTabHeader(widget.unitGrammar.grammar[i].label,
            selectedIndex[0] == i, widget.unitGrammar.grammar.length),
      ));
    }

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.unmodifiable(() sync* {
          yield addVerticalSpace(20);
          yield videoWidget;
          yield addVerticalSpace(20);
          yield const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Жишээ:',
              style: TextStyle(
                  color: colorPrimary,
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
          );
          yield Text(
            helper
                .getSentence(widget.unitGrammar.grammar[_controller.index])
                .textEng,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: colorBlack, fontWeight: FontWeight.w400, fontSize: 17),
          );
          yield addVerticalSpace(20);
          yield Text(
            helper
                .getSentence(widget.unitGrammar.grammar[_controller.index])
                .textMon,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Color.fromRGBO(168, 175, 229, 1),
                fontWeight: FontWeight.w400,
                fontSize: 15,
                fontStyle: FontStyle.italic),
          );
          yield addVerticalSpace(20);
          yield const Divider(
            color: Color.fromRGBO(199, 201, 217, 0.2),
            thickness: 1,
          );
          yield addVerticalSpace(10);
          yield Visibility(
            visible: !isType1,
            child: const Align(
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
          );
          yield Visibility(
            visible: !isType1,
            child: Padding(
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
                  tabs: tabs,
                  controller: _controller,
                  onTap: (index) {
                    selectedIndex[0] = index;
                    refreshView.value = !refreshView.value;
                  },
                ),
              ),
            ),
          );
          yield Flexible(
            fit: FlexFit.tight,
            child: buildTabview(
                widget.unitGrammar.grammar[selectedIndex[0]], helper,
                (answer, level) {
              if (isType1) {
                var id = helper.grammarIndex(
                        widget.unitGrammar.grammar[selectedIndex[0]]) +
                    level;
                if (helper.selectedGrammar ==
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
              } else {
                var id = helper.grammarIndex(
                        widget.unitGrammar.grammar[selectedIndex[0]]) +
                    level;

                if (level == 1 &&
                    helper.selectedGrammar!.grammarNameEng ==
                        widget.unitGrammar.grammar[selectedIndex[0]]
                            .grammarNameEng) {
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
              }
            }, isType1),
          );
        }()),
      ),
    );
  }

  Widget buildTabview(Grammar grammar, Grammarhelper helper,
      UnitGrammarCallback callBack, bool isType1) {
    List<Widget> list = [];

    for (int i = 1; i < 7; i++) {
      if (grammar.getPart(i) != null) {
        list.addAll(buildStructure(
            grammar, helper, grammar.getPart(i)!, i, callBack, isType1));
      }
    }

    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(0),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return list[index];
      },
    );
  }

  List<Widget> buildStructure(
      Grammar grammar,
      Grammarhelper helper,
      String partLabel,
      int partId,
      UnitGrammarCallback callBack,
      bool isType1) {
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
            child:
                StructureBody(grammar, helper, partLabel, partId, (val, level) {
              callBack.call(val, level);
            }, isType1),
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
      child: isLight
          ? Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
              decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color.fromRGBO(120, 100, 254, 1)),
                  borderRadius: const BorderRadius.all(Radius.circular(20.0))),
              child:
                  //AnimatedTextWidget(partLabel)
                  BlinkWidget(
                [
                  Text(
                    partLabel,
                    style: const TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Roboto',
                        fontSize: 17,
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
                ],
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromRGBO(199, 201, 217, .5)),
                  borderRadius: const BorderRadius.all(Radius.circular(20.0))),
              child: Text(
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

  _buildTabHeader(String text, bool isSelected, int tabcount) {
    return SizedBox(
      width: GlobalValues.screenWidth / (tabcount == 3 ? 1 : 6),
      child: isSelected
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
            ),
    );
  }
}
