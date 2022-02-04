import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';

class ModuleWritingPage extends StatefulWidget {
  const ModuleWritingPage({Key? key}) : super(key: key);

  @override
  _ModuleWritingPageState createState() => _ModuleWritingPageState();
}

class _ModuleWritingPageState extends State<ModuleWritingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: ColorTable.color255_255_255,
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Writing',
              style: TextStyle(color: colorPrimary),
            ),
          ],
        ),
      ),
    );
  }
}
