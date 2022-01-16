import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/components/landing_header.dart';

class ModuleReadingPage extends StatefulWidget {
  const ModuleReadingPage({Key? key}) : super(key: key);

  @override
  _ModuleReadingPageState createState() => _ModuleReadingPageState();
}

class _ModuleReadingPageState extends State<ModuleReadingPage> {
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
              'Reading',
              style: TextStyle(color: colorPrimary),
            ),
          ],
        ),
      ),
    );
  }
}
