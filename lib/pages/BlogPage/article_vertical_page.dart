import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// ignore: must_be_immutable
class ArticleVerticalPage extends HookWidget {
  ArticleVerticalPage({Key? key, this.title,this.typeId}) : super(key: key);
  String? title;
  String? typeId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: Container(
          margin: const EdgeInsets.all(20),
          child: const Text("fdsfdsfds"),
          ),
    );
  }
}
