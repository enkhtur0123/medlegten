// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UnitModuleCompletedBtn extends HookWidget {
  UnitModuleCompletedBtn(
      {Key? key, this.moduleId,required this.completeBtn, required this.unCompleteBtn})
      : super(key: key);
  String? moduleId;
  VoidCallback? completeBtn;
  VoidCallback? unCompleteBtn;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(15),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
                onTap: () {
                  completeBtn!();
                },
                child: const Icon(Icons.check)),
            const SizedBox(
              width: 15,
            ),
            GestureDetector(
                onTap: () {
                  unCompleteBtn!();
                },
                child: const Icon(Icons.close)),
          ],
        ));
  }
}
