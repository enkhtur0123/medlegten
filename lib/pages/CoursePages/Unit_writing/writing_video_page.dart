import 'package:flutter/material.dart';
import 'package:medlegten/models/Unit/unit_writing.dart';

class WritingVideoPage extends StatefulWidget {
  const WritingVideoPage(this.unitWriting, {Key? key,this.moduleId}) : super(key: key);

  final UnitWriting unitWriting;
  final String? moduleId;

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
    // TODO: implement build
    throw UnimplementedError();
  }
}
