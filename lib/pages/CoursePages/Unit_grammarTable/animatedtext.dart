import 'package:flutter/material.dart';

class AnimatedTextWidget extends StatefulWidget {
  final String text;
  const AnimatedTextWidget(this.text, {Key? key}) : super(key: key);

  @override
  _AnimatedTextWidgetState createState() => _AnimatedTextWidgetState();
}

class _AnimatedTextWidgetState extends State<AnimatedTextWidget> {
  bool _first = true;
  double _fontSize = 20;

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _fontSize = _first ? 16 : 20;
        _first = !_first;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      child: Text(widget.text, textAlign: TextAlign.center),
      curve: Curves.ease,
      style: TextStyle(
          color: const Color.fromRGBO(0, 0, 0, 1),
          fontFamily: 'Roboto',
          fontSize: _fontSize,
          fontWeight: FontWeight.w500),
      duration: const Duration(milliseconds: 500),
    );
  }
}
