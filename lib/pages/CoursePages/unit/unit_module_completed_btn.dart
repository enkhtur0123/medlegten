// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/repositories/course_repository.dart';
import 'package:medlegten/widgets/dialog/confirm_dialog.dart';

class UnitModuleCompletedBtn extends HookWidget {
  UnitModuleCompletedBtn(
      {Key? key,
      this.moduleId,
      required this.completeBtn,
      required this.unCompleteBtn,
      this.success,
      this.failure})
      : super(key: key);
  String? moduleId;
  VoidCallback? completeBtn;
  VoidCallback? unCompleteBtn;
  Function? success;
  Function? failure;

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
              onTap: () async {
                await showDialog<bool>(
                    context: context,
                    builder: (context) {
                      return ConfirmDialog(
                        text: "Энэ модулийг дуусгахдаа итгэлтэй байна уу?",
                        isAlert: true,
                      );
                    }).then((value) async {
                  if (value != null && value) {
                    await CourseRepository().setUnitModuleComplete(
                        moduleId: moduleId, completeType: "1");
                  }
                });
              },
              child: const Icon(Icons.check)),
          const SizedBox(
            width: 15,
          ),
          GestureDetector(
              onTap: () async {
                await showDialog<bool>(
                    context: context,
                    builder: (context) {
                      return ConfirmDialog(
                        text:
                            "Энэ модулийг үзээгүй болгохдоо итгэлтэй байна уу?",
                        isAlert: true,
                      );
                    }).then((value) async {
                  if (value != null && value) {
                    await CourseRepository().setUnitModuleComplete(
                        moduleId: moduleId, completeType: "0");
                  }
                });
              },
              child: const Icon(Icons.close)),
        ],
      ),
    );
  }
}
