import 'package:flutter/material.dart';
import 'package:medlegten/models/Unit/unit_writing.dart';
import 'package:medlegten/pages/CoursePages/unit/unit_module_completed_btn.dart';

class WritingVideoPage extends StatefulWidget {
  const WritingVideoPage(this.unitWriting, {Key? key, this.moduleId,this.isCompleted})
      : super(key: key);

  final UnitWriting unitWriting;
  final String? moduleId;
  final bool? isCompleted;

  @override
  _WritingVideoPageState createState() => _WritingVideoPageState();
}

class _WritingVideoPageState extends State<WritingVideoPage> {
  late final ValueNotifier<bool> refreshNotifier = ValueNotifier(false)
    ..addListener(_listener);

  void _listener() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    refreshNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          UnitModuleCompletedBtn(
            moduleId: widget.moduleId,
            completeBtn: () {},
            unCompleteBtn: () {},
            isCompleted: widget.isCompleted,
          ),
        ],
      ),
      body: Container(),
    );
  }
}
