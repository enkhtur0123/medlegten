// ignore_for_file: prefer_const_constructors_in_immutables
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/pages/CoursePages/unit/unit_module_completed_btn.dart';
import 'package:medlegten/repositories/course_repository.dart';
import 'package:medlegten/themes/style.dart';

const double unitHeaderHeight = 74;
const TextStyle titleStyle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18);

Widget headerCompleteButton(String moduleId, bool isCompleted) {
  return IconButton(
      onPressed: () {
        CourseRepository().setUnitModuleComplete(
            completeType: isCompleted ? '0' : '1', moduleId: moduleId);
      },
      icon: Icon(isCompleted
          ? Icons.check_box_outlined
          : Icons.check_box_outline_blank_rounded));
}

// ignore: must_be_immutable
class UnitAppBar extends ConsumerStatefulWidget implements PreferredSizeWidget {
  String title;
  Widget? tailWidget;
  String? moduleId;
  bool? isCompleted;
  UnitAppBar(this.title,
      {Key? key, this.tailWidget, this.moduleId, required this.isCompleted})
      : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _UnitAppBarState();
  }

  @override
  Size get preferredSize => const Size(double.infinity, unitHeaderHeight + 8);
}

class _UnitAppBarState extends ConsumerState<UnitAppBar> {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    list.add(
      IconButton(
        onPressed: () {
          AutoRouter.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back,
          color: colorWhite,
          size: 23,
        ),
      ),
    );

    list.add(
      Flexible(
        fit: FlexFit.tight,
        child: AutoSizeText(
          widget.title,
          style: titleStyle,
          maxLines: 2,
        ),
      ),
    );

    list.add(const Spacer());
    if (widget.tailWidget != null) {
      list.add(widget.tailWidget!);
    }

    //setUnitModuleComplete
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8))),
      height: unitHeaderHeight + 8,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 5, top: 20, right: 20),
      child: Row(
        children: [
          Flexible(
            fit: FlexFit.tight,
            flex: 6,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: list),
          ),
          widget.moduleId != null
              ? Flexible(
                  fit: FlexFit.tight,
                  flex: 2,
                  child: UnitModuleCompletedBtn(
                    moduleId: widget.moduleId,
                    completeBtn: () {},
                    unCompleteBtn: () {},
                    isCompleted: widget.isCompleted,
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
