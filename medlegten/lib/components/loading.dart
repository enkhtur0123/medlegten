import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loading extends StatelessWidget {
  final double size;
  // ignore: prefer_const_constructors_in_immutables
  Loading(this.size, {Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LottieBuilder.asset('assets/json/loading.json', height: size),
    );
  }
}
