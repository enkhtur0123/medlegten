import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/components/landing_header.dart';

class ModuleFinalExamPage extends StatefulWidget {
  const ModuleFinalExamPage({Key? key}) : super(key: key);

  @override
  _ModuleFinalExamPageState createState() => _ModuleFinalExamPageState();
}

class _ModuleFinalExamPageState extends State<ModuleFinalExamPage> {
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
              'finalExam',
              style: TextStyle(color: colorPrimary),
            ),
          ],
        ),
      ),
    );
  }
}
