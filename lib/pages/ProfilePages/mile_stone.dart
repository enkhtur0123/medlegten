import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/models/video/mile_stone.dart';
import 'package:medlegten/models/video/mile_stone_item.dart';
import 'package:medlegten/utils/hex_color.dart';

class MileStonePage extends StatefulWidget {
  const MileStonePage({Key? key, this.mileStone, this.isLast = false, this.currentIndex = 0}) : super(key: key);

  final MileStone? mileStone;
  final bool? isLast;
  final int? currentIndex;
  @override
  State<StatefulWidget> createState() {
    return MileStonePageState();
  }
}

class MileStonePageState extends State<MileStonePage> {
  MileStoneItem? current;
  MileStoneItem? next;
  Color? currentColor;
  Color? nextColor;
  MileStone? mileStone;
  @override
  void initState() {
    super.initState();
    mileStone = widget.mileStone;
    currentColor = HexColor(widget.mileStone!.mileStone![widget.currentIndex!].color!);
    current = widget.mileStone!.mileStone![widget.currentIndex!];
    if (!widget.isLast!) {
      next = widget.mileStone!.mileStone![widget.currentIndex! + 1];
      nextColor = HexColor(widget.mileStone!.mileStone![widget.currentIndex! + 1].color!);
    }
  
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          mileStoneItemWidget(context: context, title: "Мэддэг үг", icon: "memorize.svg", isKnownWord: true),
          Container(
            margin: const EdgeInsets.only(top: 30),
            child:
                mileStoneItemWidget(context: context, title: "Үзсэн контент", icon: "content.svg", isSeenContent: true),
          )
         
        ],
      ),
    );
  }

  Widget mileStoneItemWidget(
      {BuildContext? context, String? title, String? icon, bool? isKnownWord = false, bool? isSeenContent = false}) {
    int wordNum = int.parse(current!.wordNum!);
    int ppvNum = int.parse(current!.ppvNum!);
    int nextStageCnt = isKnownWord! ? (wordNum - mileStone!.knowingWordCount) : (ppvNum - mileStone!.completedPpvCount);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        header(icon: icon, title: title),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 3,
              child: stageItemWidget(
                context: context,
                isKnownWord: isKnownWord,
                isSeenContent: isSeenContent,
                subTitle: isKnownWord ? "Одоо" : null,
                color: currentColor,
                value: isKnownWord
                    ? mileStone!.knowingWordCount.toString()
                    : mileStone!.completedPpvCount.toString(),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 3,
              child: stageItemWidget(
                  context: context,
                  isKnownWord: isKnownWord,
                  isSeenContent: isSeenContent,
                  subTitle: isKnownWord ? "Дараагийн шат" : null,
                  value: "+" + (nextStageCnt >= 0 ? nextStageCnt.toString() : "0"),
                  color: nextColor ?? currentColor),
            ),
          ],
        )
      ],
    );
  }

  ///Толгой хэсэг
  Widget header({String? icon, String? title}) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/img/video/$icon",
          width: 35,
          height: 35,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          title!,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: colorPrimary, fontWeight: FontWeight.w800, fontSize: 18),
        ),
      ],
    );
  }

  /// Шугам татсан хэсгийн body хэсэг
  Widget stageItemWidget({
    BuildContext? context,
    Color? color,
    bool? isKnownWord = false,
    bool? isSeenContent = false,
    String? subTitle,
    String? value = "",
  }) {
    return SizedBox(
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20),
            height: 70,
            width: 5,
            decoration: BoxDecoration(color: color!, borderRadius: const BorderRadius.all(Radius.circular(10))),
          ),
          const SizedBox(
            width: 15,
          ),
          subTitle != null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subTitle,
                      style: Theme.of(context!).textTheme.subtitle1!.copyWith(color: colorPrimary),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Text(
                        value!,
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: const Color(0xff1D2129), fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                )
              : SizedBox(
                  child: Text(
                    value!,
                    style: Theme.of(context!)
                        .textTheme
                        .headline6!
                        .copyWith(color: Color(0xff1D2129), fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                )
        ],
      ),
    );
  }
}
