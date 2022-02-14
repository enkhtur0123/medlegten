// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/repositories/course_repository.dart';
import 'package:medlegten/services/custom_exception.dart';
import 'package:medlegten/widgets/dialog/confirm_dialog.dart';
import 'package:medlegten/widgets/dialog/custom_popup.dart';

class UnitModuleCompletedBtn extends HookWidget {
  UnitModuleCompletedBtn(
      {Key? key,
      this.moduleId,
      required this.completeBtn,
      required this.unCompleteBtn,
      this.success,
      this.failure,
      required this.isCompleted})
      : super(key: key);
  String? moduleId;
  VoidCallback? completeBtn;
  VoidCallback? unCompleteBtn;
  Function? success;
  Function? failure;
  bool? isCompleted;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          !isCompleted!
              ? GestureDetector(
                  onTap: () async {
                    await showDialog<bool>(
                        context: context,
                        builder: (context) {
                          return ConfirmDialog(
                            text: "Энэ хичээлийг дуусгахдаа итгэлтэй байна уу?",
                            isAlert: true,
                          );
                        }).then((value) async {
                      if (value != null && value) {
                        setUnitComplete(type: "1", context: context);
                      }
                    });
                  },
                  child: const Icon(Icons.check))
              : GestureDetector(
                  onTap: () async {
                    await showDialog<bool>(
                        context: context,
                        builder: (context) {
                          return ConfirmDialog(
                            text:"Энэ хичээлийг үзээгүй болгохдоо итгэлтэй байна уу?",
                            isAlert: true,
                          );
                        }).then((value) async {
                      if (value != null && value) {
                        setUnitComplete(type: "0", context: context);
                      }
                    });
                  },
                  child: const Icon(Icons.close),
                ),
        ],
      ),
    );
}

  Future<void> setUnitComplete({String? type, BuildContext? context}) async {
    try {
      await CourseRepository()
          .setUnitModuleComplete(moduleId: moduleId, completeType: type);
      await showDialog(
          barrierDismissible: true,
          context: context!,
          builder: (context) {
            return const CustomPopUpDialog(
              isSuccess: true,
              body: "",
            );
          });
      Navigator.pop(context);
    } on CustomException catch (ex) {
      await showDialog(
          barrierDismissible: true,
          context: context!,
          builder: (context) {
            return CustomPopUpDialog(
              isError: true,
              body: ex.toString(),
            );
          });
    } catch (ex) {
      await showDialog(
        barrierDismissible: true,
          context: context!,
          builder: (context) {
            return CustomPopUpDialog(
              isError: true,
              body: ex.toString(),
            );
          });
    }
  }
}
