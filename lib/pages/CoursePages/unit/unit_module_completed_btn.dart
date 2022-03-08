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
    TextStyle textStyle = const TextStyle(
        fontSize: 13,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
        color: Colors.white);
    return GestureDetector(
      onTap: () async {
        await showDialog<bool>(
            context: context,
            builder: (context) {
              return ConfirmDialog(
                text: !isCompleted!
                    ? "Энэ хичээлийг дуусгахдаа итгэлтэй байна уу?"
                    : "Энэ хичээлийг үзээгүй болгохдоо итгэлтэй байна уу?",
                isAlert: true,
              );
            }).then((value) async {
          if (value != null && value) {
            setUnitComplete(type: !isCompleted! ? "1" : "0", context: context);
          }
        });
      },
      child: Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
        decoration: const BoxDecoration(
          color: Color(0xffA8AFE5),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            !isCompleted!
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Flexible(flex: 1, child: Icon(Icons.check)),
                      const SizedBox(
                        width: 5,
                      ),
                      Flexible(
                        flex: 3,
                        child: Text(
                          "Дуусгах".toUpperCase(),
                          style: textStyle,
                        ),
                      ),
                    ],
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Flexible(
                        flex: 1,
                        child: Icon(Icons.close),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Flexible(
                        flex: 3,
                        child: Text("Буцаах".toUpperCase(), style: textStyle),
                      ),
                    ],
                  ),
          ],
        ),
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
