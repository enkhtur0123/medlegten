import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/models/Unit/unit_writing.dart';
import 'package:medlegten/pages/CoursePages/Unit_writing/writing_video_play.dart';

import '../unit/unit_module_completed_btn.dart';

typedef SubVideoCallback = void Function(int callIndex, bool next);

class WritingVideoPage extends StatefulWidget {
  const WritingVideoPage(this.unitWriting, this.unitTitle,
      {Key? key, this.moduleId, this.isCompleted})
      : super(key: key);

  final UnitWriting unitWriting;
  final String? moduleId;
  final bool? isCompleted;
  final String unitTitle;

  @override
  _WritingVideoPageState createState() => _WritingVideoPageState();
}

class _WritingVideoPageState extends State<WritingVideoPage> {
  int currentIndex = 0;
  Map<Widget, GlobalObjectKey<WritingVideoSubPageState>> keys = {};
  List<Widget> listWidget = [];

  @override
  void initState() {
    for (int i = 0; i < widget.unitWriting.videos.length; i++) {
      GlobalObjectKey<WritingVideoSubPageState> subPageStateKey =
          GlobalObjectKey<WritingVideoSubPageState>(i);
      var myWidget = WritingVideoSubPage(widget.unitWriting.videos[i], [
        i - 1, //if -1 then no prev button
        i, //current index
        i - (widget.unitWriting.videos.length - 1), // if 0 then no next button
        widget.unitWriting.videos.length,
        currentIndex,
      ], (callBackIndex, next) {
        if (keys.containsKey(listWidget[callBackIndex])) {
          if (keys[listWidget[callBackIndex]]!.currentState != null) {
            keys[listWidget[callBackIndex]]!.currentState!.pauseVideo();
          }
        }
        currentIndex = next ? callBackIndex + 1 : callBackIndex - 1;
        if (keys.containsKey(listWidget[currentIndex])) {
          if (keys[listWidget[currentIndex]]!.currentState != null) {
            keys[listWidget[currentIndex]]!.currentState!.playVideo();
          }
        }
        setState(() {});
      }, key: subPageStateKey);

      listWidget.add(myWidget);

      keys[myWidget] = subPageStateKey;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.unitTitle),
        actions: [
          UnitModuleCompletedBtn(
            moduleId: widget.moduleId,
            completeBtn: () {},
            unCompleteBtn: () {},
            isCompleted: widget.isCompleted,
          ),
        ],
      ),
      backgroundColor: ColorTable.color255_255_255,
      resizeToAvoidBottomInset: true,
      body: body(),
      // body: Stack(children: [
      //   Positioned(
      //     top: unitHeaderHeight,
      //     width: MediaQuery.of(context).size.width,
      //     height: MediaQuery.of(context).size.height - unitHeaderHeight,
      //     child: body(),
      //   ),
      //   Positioned(
      //     width: MediaQuery.of(context).size.width,
      //     height: unitHeaderHeight + 8,
      //     child: UnitAppBar(
      //       widget.unitTitle,
      //       moduleId: widget.moduleId,
      //       isCompleted: widget.isCompleted,
      //     ),
      //   ),
      // ]),
    );
  }

  Widget body() {
    return IndexedStack(
        sizing: StackFit.expand, index: currentIndex, children: listWidget);
  }
}
