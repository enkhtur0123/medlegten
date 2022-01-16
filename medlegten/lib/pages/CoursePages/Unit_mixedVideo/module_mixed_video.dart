import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/components/landing_header.dart';

class ModuleMixedVideoPage extends StatefulWidget {
  const ModuleMixedVideoPage({Key? key}) : super(key: key);

  @override
  _ModuleMixedVideoPageState createState() => _ModuleMixedVideoPageState();
}

class _ModuleMixedVideoPageState extends State<ModuleMixedVideoPage> {
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
              'mixedVideo',
              style: TextStyle(color: colorPrimary),
            ),
          ],
        ),
      ),
    );
  }
}
