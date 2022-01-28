import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/components/landing_header.dart';

class ConversationVideoPage extends StatefulWidget {
  const ConversationVideoPage({Key? key}) : super(key: key);

  @override
  _ModuleConversationVideoPageState createState() =>
      _ModuleConversationVideoPageState();
}

class _ModuleConversationVideoPageState extends State<ConversationVideoPage> {
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
              'conversationVideo',
              style: TextStyle(color: colorPrimary),
            ),
          ],
        ),
      ),
    );
  }
}
