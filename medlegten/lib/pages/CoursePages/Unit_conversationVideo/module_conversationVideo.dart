import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/components/landing_header.dart';

class ModuleConversationVideoPage extends StatefulWidget {

  @override
  _ModuleConversationVideoPageState createState() => _ModuleConversationVideoPageState();
}

class _ModuleConversationVideoPageState extends State<ModuleConversationVideoPage> {
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
            Text('conversationVideo', style: TextStyle(color: colorPrimary),),
          ],
        ),
      ),
    );
  }

}