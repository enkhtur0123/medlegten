import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/components/landing_header.dart';

class ModuleListenPage extends StatefulWidget {

  @override
  _ModuleListenPageState createState() => _ModuleListenPageState();
}

class _ModuleListenPageState extends State<ModuleListenPage> {
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
            Text('listening', style: TextStyle(color: colorPrimary),),
          ],
        ),
      ),
    );
  }

}