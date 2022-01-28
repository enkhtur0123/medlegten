import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Empty extends StatelessWidget {
  final double size;
  // ignore: prefer_const_constructors_in_immutables
  Empty(this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Logged in'),
    );
  }
}
