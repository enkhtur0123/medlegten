import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/components/loading.dart';
import 'package:medlegten/models/Unit/cue_word.dart';
import 'package:medlegten/pages/CoursePages/base/clip_shadow.dart';
import 'package:medlegten/pages/CoursePages/base/cue_wrapper.dart';
import 'package:medlegten/pages/CoursePages/base/message.dart';
import 'package:medlegten/repositories/unit_repository.dart';

const double cueWidgetHeight = 240;

class CueWordWidget extends StatefulWidget {
  const CueWordWidget(this.word,
      {Key? key, Rect? ppointerPosition, bool? isshadow, bool? istop})
      : pointerPosition = ppointerPosition ?? Rect.zero,
        isShadow = isshadow ?? false,
        isTop = istop ?? true,
        super(key: key);
  final CWord word;
  final Rect pointerPosition;
  final bool isShadow;
  final bool isTop;
  @override
  _CueWordWidgetState createState() => _CueWordWidgetState();
}

class _CueWordWidgetState extends State<CueWordWidget> {
  @override
  Widget build(BuildContext context) {
    return body(context, widget.word);
  }

  Widget body(BuildContext context, CWord word) {
    double messageBoxWidth = MediaQuery.of(context).size.width - 40;
    var left =
        widget.pointerPosition.left; // + widget.pointerPosition.width / 2 - 20;
    if (left < 10) {
      left = 10;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Message(
        triangleX1: left, //0.4 * messageBoxWidth,
        triangleX2: left + 22, //0.5 * messageBoxWidth,
        triangleX3: left + 11, //0.5 * messageBoxWidth,
        triangleY1: 12, // cueWidgetHeight * 0.2,
        clipShadows: [ClipShadow(color: Colors.grey.withOpacity(0.8))],
        isTop: widget.isTop,
        isShadow: widget.isShadow,
        child: Container(
          color: Colors.white,
          width: messageBoxWidth,
          height: cueWidgetHeight,
          child: FutureBuilder<CueWord?>(
            future: UnitRepository().getCueWord(word.wordValue), // async work
            builder: (BuildContext context, AsyncSnapshot<CueWord?> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Loading();
                default:
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return innerWidget(snapshot.data);
                  }
              }
            },
          ),
        ),
      ),
    );
    // var left = widget.pointerPosition.left + widget.pointerPosition.width / 2;
    // if (left > MediaQuery.of(context).size.width * 0.88 - 10) {
    //   left = MediaQuery.of(context).size.width * 0.88 - 10;
    // }
    // if (left < 40) {
    //   left = 40;
    // }
    // return SizedBox(
    //   height: cueWidgetHeight,
    //   width: double.infinity,
    //   child: Stack(
    //     children: [
    //       Positioned(
    //         top: widget.isTop ? 15 : 5,
    //         left: 20,
    //         child: Container(
    //           height: cueWidgetHeight - 30,
    //           width: MediaQuery.of(context).size.width * 0.88,
    //           decoration: BoxDecoration(
    //             boxShadow: [
    //               BoxShadow(
    //                 color: widget.isShadow
    //                     ? Colors.grey.withOpacity(0.2)
    //                     : Colors.transparent,
    //                 spreadRadius: widget.isShadow ? 5 : 0,
    //                 blurRadius: widget.isShadow ? 7 : 0,
    //                 offset: const Offset(0, 3), // changes position of shadow
    //               ),
    //             ],
    //             color: Colors.white,
    //             borderRadius: BorderRadius.circular(8),
    //             border: Border.all(
    //                 color: const Color.fromRGBO(174, 177, 239, .3), width: 1),
    //           ),
    //           child: FutureBuilder<CueWord?>(
    //             future:
    //                 UnitRepository().getCueWord(word.wordValue), // async work
    //             builder:
    //                 (BuildContext context, AsyncSnapshot<CueWord?> snapshot) {
    //               switch (snapshot.connectionState) {
    //                 case ConnectionState.waiting:
    //                   return const Loading();
    //                 default:
    //                   if (snapshot.hasError) {
    //                     return Text('Error: ${snapshot.error}');
    //                   } else {
    //                     return innerWidget(snapshot.data);
    //                   }
    //               }
    //             },
    //           ),
    //         ),
    //       ),
    //       Positioned(
    //           top: widget.isTop ? 5 : cueWidgetHeight - 11,
    //           left: left,
    //           child: CustomPaint(
    //               size: const Size(40, 40),
    //               painter:
    //                   ShapesPainter(widget.isShadow, widget.isTop, false))),
    //       Positioned(
    //           top: !widget.isShadow ? 6 : cueWidgetHeight * -10,
    //           left: left,
    //           child: CustomPaint(
    //               size: const Size(40, 40),
    //               painter:
    //                   ShapesPainter(!widget.isShadow, widget.isTop, true))),
    //     ],
    //   ),
    // );
  }

  Widget innerWidget(CueWord? cueWord) {
    if (cueWord == null) {
      return const Center(
        child: Text(
          'Олдсонгүй!',
          style: TextStyle(
              color: Colors.red, fontSize: 15, fontWeight: FontWeight.w500),
        ),
      );
    }

    List<Widget> list = [];

    list.add(Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(120, 100, 254, 1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: const Color.fromRGBO(174, 177, 239, .3), width: 1),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 12, top: 5, right: 12, bottom: 5),
            child: Text(
              cueWord.word,
              style: const TextStyle(
                  color: colorWhite, fontWeight: FontWeight.w700, fontSize: 16),
            ),
          ),
        ),
        IconButton(
          padding: const EdgeInsets.only(bottom: 16),
          onPressed: () => {},
          icon: const Icon(
            Icons.volume_up_outlined,
            color: Color.fromRGBO(48, 53, 159, 0.8),
            size: 28.0,
          ),
        ),
        Expanded(child: Container()),
        IconButton(
          padding: const EdgeInsets.only(bottom: 16),
          onPressed: () => {},
          icon: const Icon(
            Icons.bookmark_outline_sharp,
            color: Color.fromRGBO(48, 53, 159, 0.8),
            size: 28.0,
          ),
        ),
      ],
    ));

    if (cueWord.rootWordInfo.rootWord != null) {
      list.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Үгийн үндэс',
              style: TextStyle(
                  color: Color.fromRGBO(48, 53, 159, 1),
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            addHorizontalSpace(20),
            Text(
              cueWord.rootWordInfo.rootWord!,
              style: const TextStyle(
                  color: Color.fromRGBO(48, 53, 159, .3),
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      );
    }

    for (var translation in cueWord.translation) {
      {
        list.add(Text(
          translation.trTypeShortName,
          style: const TextStyle(
              color: Color.fromRGBO(48, 53, 159, 1),
              fontSize: 14,
              fontWeight: FontWeight.w700),
        ));
        list.add(Text(
          translation.trText,
          style: const TextStyle(
              color: Color.fromRGBO(48, 53, 159, .6),
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ));
        list.add(addVerticalSpace(10));
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Text(
        //       translation.trTypeShortName,
        //       style: const TextStyle(
        //           color: Color.fromRGBO(48, 53, 159, 1),
        //           fontSize: 14,
        //           fontWeight: FontWeight.w700),
        //     ),
        //     Text(
        //       translation.trText,
        //       style: const TextStyle(
        //           color: Color.fromRGBO(48, 53, 159, .6),
        //           fontSize: 14,
        //           fontWeight: FontWeight.w500),
        //     ),
        //   ],
        // ),
        //);
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: list.length,
        //separatorBuilder: (BuildContext context, int index) =>
        //    addVerticalSpace(10),
        itemBuilder: (context, index) => list[index],
      ),
    );
  }
}
