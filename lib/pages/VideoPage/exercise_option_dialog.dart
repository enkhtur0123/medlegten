import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:medlegten/common/colors.dart';

class ExerciseOptionDialog extends HookConsumerWidget {
  List<Option> options = [
    Option(icon: "listen.svg", text: "Сонсгол шалгах", index: 0),
    Option(icon: "quiz.svg", text: "Үг цээжлэх", index: 1),
    Option(icon: "exam.svg", text: "Шалгалт", index: 2),
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(26),
        ),
      ),
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Нэмэлт дасгал",
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: colorPrimary, fontWeight: FontWeight.w600),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.close,
              color: colorPrimary.withOpacity(0.5),
            ),
          )
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: options.map((e) {
          return InkWell(
            onTap: () {
              Navigator.pop(context, options.indexOf(e));
            },
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xff9D9D9D).withOpacity(0.08),
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              margin: const EdgeInsets.only(top: 10),
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/img/video/${e.icon}",
                      width: 25,
                      height: 25,
                      color: colorPrimary,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      e.text!,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: colorPrimary, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    )
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class Option {
  int? index;
  String? icon;

  String? text;
  Option({this.icon, this.text, this.index});
}
