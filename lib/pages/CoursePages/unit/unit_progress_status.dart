import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
Widget iconCompleted() => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color.fromRGBO(122, 194, 23, .2),
      ),
      height: 25,
      width: 25,
      child: const Icon(
        Icons.check,
        color: Color.fromRGBO(122, 194, 23, 1),
        size: 14,
      ),
    );

Widget iconFree() => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color.fromRGBO(120, 100, 254, .2),
      ),
      height: 25,
      width: 25,
      child: const Icon(
        CupertinoIcons.lock_open_fill,
        color: Color.fromRGBO(120, 100, 254, 1),
        size: 14,
      ),
    );

Widget iconLocked() => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color.fromRGBO(120, 100, 254, .2),
      ),
      height: 25,
      width: 25,
      child: const Icon(
        CupertinoIcons.lock_fill,
        color: Color.fromRGBO(120, 100, 254, 1),
        size: 14,
      ),
    );
