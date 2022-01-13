import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/components/landing_header.dart';

class ModuleWritingPage extends StatefulWidget {

  @override
  _ModuleWritingPageState createState() => _ModuleWritingPageState();
}

class _ModuleWritingPageState extends State<ModuleWritingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTable.color255_255_255,
      body: Padding(
        padding: EdgeInsets.only(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LandingHeader(100),
            Text('Writing', style: TextStyle(color: colorPrimary),),
          ],
        ),
      ),
    );
  }

}