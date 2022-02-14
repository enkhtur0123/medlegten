import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/models/Unit/reading.dart';
import 'package:medlegten/pages/CoursePages/Unit_reading/reading_grammar.dart';
import 'package:medlegten/pages/CoursePages/Unit_reading/reading_helper.dart';
import 'package:medlegten/pages/CoursePages/Unit_reading/reading_paragraph.dart';
import 'package:medlegten/pages/CoursePages/Unit_reading/sliver_header.dart';
import 'package:medlegten/pages/CoursePages/base/base_cue_helper.dart';
import 'package:medlegten/pages/CoursePages/base/cue_word_widget.dart';
import 'package:medlegten/pages/CoursePages/base/cue_wrapper.dart';
import 'package:medlegten/pages/CoursePages/base/unit_appbar.dart';
import 'package:medlegten/utils/global.dart';

class ReadingPage extends StatefulWidget {
  const ReadingPage(this.reading, this.unitTitle, this.moduleId, {Key? key})
      : super(key: key);

  final Reading reading;
  final String unitTitle;
  final String moduleId;
  @override
  _ReadingPageState createState() => _ReadingPageState();
}

class _ReadingPageState extends State<ReadingPage> {
  late ReadingHelper helper;
  CParagraph? selectedParagraph;
  late bool isShowGrammar;
  late bool isWidgetIsShown;

  late final refreshView = ValueNotifier<bool>(false)
    ..addListener(() {
      setState(() {});
    });

  @override
  void initState() {
    isShowGrammar = false;
    isWidgetIsShown = false;
    helper = ReadingHelper();
    helper.paragraphs = ReadingHelper.convert(widget.reading);
    super.initState();
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
            widget.unitTitle,
            tailWidget: headerCompleteButton(
                widget.moduleId, widget.reading.isCompleted!),
          ),
        ),
      ]),
    );
  }

  Widget body() {
    List<Widget> widgetList = [];
    isWidgetIsShown = false;

    widgetList.add(addVerticalSpace(20));

    for (int i = 0; i < helper.paragraphs.length; i++) {
      var paragraph = helper.paragraphs[i];
      if (!helper.valueKeys.containsKey(paragraph)) {
        helper.valueKeys[paragraph] = 0;
      }

      if (isShowGrammar &&
          selectedParagraph != null &&
          paragraph.ordering == selectedParagraph!.ordering) {
        widgetList.add(childWidget(paragraph, i, true));
        widgetList.add(ReadingGrammar(paragraph));
        isShowGrammar = false;
        isWidgetIsShown = true;
      } else {
        widgetList.add(childWidget(paragraph, i, false));
      }
    }
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate:
              MyDynamicHeader(widget.reading.imgUrl, widget.reading.title),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return widgetList[index];
            },
            childCount: widgetList.length,
          ),
        ),
      ],
    );
  }

  Widget childWidget(CParagraph paragraph, int index, bool selectParagraph) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: BaseCueHelper().getMaxHeight(
            [paragraph],
            true,
            const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            helper.width),
        child: ReadingParagraph(
            paragraph,
            (word, position) {
              wordCallBack(word, position);
              if (helper.lastIndex > -1 && helper.lastIndex != index) {
                helper.valueKeys[helper.paragraphs[helper.lastIndex]] =
                    helper.valueKeys[helper.paragraphs[helper.lastIndex]]! + 1;
              }
              helper.lastIndex = index;
              refreshView.value = !refreshView.value;
            },
            (paragraph) {
              selectedParagraph = paragraph;
            },
            tailWidget(selectParagraph),
            (paragraph) {
              if (isWidgetIsShown) {
                isShowGrammar = false;
              } else {
                isShowGrammar = true;
                selectedParagraph = paragraph;
              }
              helper.valueKeys[paragraph]! + 1;
              refreshView.value = !refreshView.value;
            },
            selectParagraph,
            key: ValueKey<int>(helper.valueKeys[paragraph]!)), //
      ),
    );
  }

  Widget tailWidget(bool selected) {
    return Text(
      ' ..... ',
      style: TextStyle(
          color: selected ? colorBlack : Colors.black45,
          fontWeight: FontWeight.w700,
          fontSize: 16),
      //key: UniqueKey(),
    );
  }

  void wordCallBack(word, position) {
    if (word != null) {
      var isTop = GlobalValues.screenHeight - position.top > 220;
      SmartDialog.showAttach(
        isLoadingTemp: false,
        targetContext: null,
        target: Offset(
            10, isTop == false ? position.top - 220 - 30 : position.top + 30),
        //isPenetrateTemp: true,
        //alignmentTemp: Alignment.bottomCenter,
        useSystem: false,
        isUseAnimationTemp: false,
        maskColorTemp: Colors.transparent,
        widget: SizedBox(
          height: 220 + 20,
          width: GlobalValues.getWidthRelativeToScreen(51),
          child: CueWordWidget(word,
              ppointerPosition: position, isshadow: true, istop: isTop),
        ),
      );
      // showDialog(
      //     context: context,
      //     barrierColor: Colors.transparent,
      //     barrierDismissible: true,
      //     builder: (BuildContext context) {
      //       return ReadingPopUpDialog(word, position);
      //     });
    }
  }

  Widget maxExtentProtoType() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          width: double.infinity,
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Squid Game Facts That Make You Appreciate The Show Even More',
                    style: TextStyle(
                        color: colorPrimary,
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                ),
              ),
              IconButton(
                onPressed: () => {},
                icon: const Icon(
                  Icons.bookmark_outline_sharp,
                  color: Color.fromRGBO(48, 53, 159, 1),
                  size: 28.0,
                ),
              ),
            ],
          ),
        ),
        Image.asset(
          'assets/SliverImage.png',
          fit: BoxFit.cover,
        ),
        addVerticalSpace(10),
        const Divider(thickness: 1, color: Colors.black12),
      ],
    );
  }
}
