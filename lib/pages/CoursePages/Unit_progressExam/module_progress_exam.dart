import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/components/landing_header.dart';

class ModuleProgressExamPage extends StatefulWidget {
  const ModuleProgressExamPage({Key? key}) : super(key: key);

  @override
  _ModuleProgressExamPageState createState() => _ModuleProgressExamPageState();
}

class _ModuleProgressExamPageState extends State<ModuleProgressExamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTable.color255_255_255,
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LandingHeader(100),
            const Text(
              'progressExam',
              style: TextStyle(color: colorPrimary),
            ),
          ],
        ),
      ),
    );
  }
}
