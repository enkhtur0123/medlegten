import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/models/Unit/unit_writing.dart';
import 'package:medlegten/pages/CoursePages/Unit_writing/writing_video_play.dart';
import 'package:medlegten/pages/CoursePages/base/unit_appbar.dart';

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
  final PageController controller =
      PageController(initialPage: 0, keepPage: true);
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
    List<Widget> listWidget = [];
    for (int i = 0; i < widget.unitWriting.videos.length; i++) {
      listWidget.add(WritingVideoSubPage(widget.unitWriting.videos[i], [
        i - 1, //if -1 then no prev button
        i, //current index
        i - (widget.unitWriting.videos.length - 1), // if 0 then no next button
        i - currentIndex, //if 0 then is selected
        widget.unitWriting.videos.length
      ], (callBackIndex, next) {
        //setState(() {
        currentIndex = next ? callBackIndex + 1 : callBackIndex - 1;
        controller.animateToPage(currentIndex,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut);
        //});
      }));
    }
    return PageView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: listWidget.length,
      controller: controller,
      itemBuilder: (context, position) {
        return listWidget[position];
      },
    );
  }
}
