import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:medlegten/models/video/mile_stone.dart';
import 'package:medlegten/models/video/mile_stone_item.dart';
import 'package:medlegten/utils/hex_color.dart';

// ignore: must_be_immutable
class LevelWidget extends HookConsumerWidget {
  MileStone? mileStone;

  LevelWidget({Key? key, this.mileStone}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: mileStone!.mileStone!.map((e) {
        return Flexible(
          fit: FlexFit.loose,
          child: levelItemWidget(context: context, mileStoneItem: e),
        );
      }).toList(),
    );
  }

  Widget levelItemWidget({BuildContext? context, MileStoneItem? mileStoneItem}) {
    return Container(
      margin: const EdgeInsets.only(right: 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            mileStoneItem!.name!,
            style: Theme.of(context!).textTheme.subtitle1!.copyWith(
                fontSize: 12,
                color:
                    mileStoneItem.current == "0" ? const Color(0xff7864FE).withOpacity(0.3) : const Color(0xff7864FE),
                fontWeight: mileStoneItem.current == "0" ? FontWeight.w400 : FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 6,
          ),
          Container(
            width: 55,
            height: 8,
            decoration: BoxDecoration(color: HexColor(mileStoneItem.color!)),
          )
        ],
      ),
    );
  }
}
