import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/models/video/video_vocabulary_word.dart';
import 'package:medlegten/repositories/unit_repository.dart';

class VocabularyCart extends HookWidget {
  const VocabularyCart(this.wordInfo, {Key? key}) : super(key: key);
  final VideoVocabularyWord wordInfo;

  @override
  Widget build(BuildContext context) {
    final toggleMedneMedehgui = useState(false);

    useEffect(() {
      toggleMedneMedehgui.value = wordInfo.isKnow;
    }, [wordInfo]);

    List<Widget> list = [];
     if (wordInfo.rootWordInfo.rootWord != null) {
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
              wordInfo.rootWordInfo.rootWord!,
              style: const TextStyle(
                  color: Color.fromRGBO(48, 53, 159, .3),
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      );

      if (wordInfo.rootWordInfo.translation != null) {
        for (var translation in wordInfo.rootWordInfo.translation!) {
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
          }
        }
      }
    }
    for (var translation in wordInfo.translation) {
      {
        list.add(Text(
          translation.trTypeShortName,
          style: const TextStyle(
              fontFamily: 'Roboto',
              color: Color.fromRGBO(48, 53, 159, 1),
              fontSize: 11,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500),
        ));
        list.add(Text(
          translation.trText,
          style: const TextStyle(
              fontFamily: 'Roboto',
              color: Color.fromRGBO(48, 53, 159, .6),
              fontSize: 11,
              fontWeight: FontWeight.w400),
        ));
        list.add(addVerticalSpace(10));
      }
    }
    // for (var translation in wordInfo.translation) {
    //   {
    //     list.add(Text(
    //       translation.trTypeShortName,
    //       style: const TextStyle(
    //           fontFamily: 'Roboto',
    //           coloColor.fromARGB(255, 0, 1, 12) 1),
    //           fontSize: 11,
    //           fontStyle: FontStyle.italic,
    //           fontWeight: FontWeight.w500),
    //     ));
    //     list.add(Text(
    //       translation.trText,
    //       style: const TextStyle(
    //           fontFamily: 'Roboto',
    //           color: Color.fromRGBO(48, 53, 159, .6),
    //           fontSize: 11,
    //           fontWeight: FontWeight.w400),
    //     ));
    //     list.add(addVerticalSpace(10));
    //   }
    // }

    return SizedBox(
      width: double.infinity,
      height: 150,
      child: Card(
        color: ColorTable.color255_255_255,
        borderOnForeground: true,
        shadowColor: const Color.fromRGBO(120, 100, 254, 0.3),
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
              width: 1, color: Color.fromRGBO(120, 100, 254, 0.3)),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, top: 8, bottom: 8, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      wordInfo.word,
                      style: const TextStyle(
                          fontFamily: 'Roboto',
                          color: Color.fromRGBO(48, 53, 159, 1),
                          fontWeight: FontWeight.w700,
                          fontSize: 14),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: list.length,
                          itemBuilder: (context, index) => list[index]),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    getMedneMedehgui(toggleMedneMedehgui.value, true, () async {
                      //MEDNE
                      UnitRepository()
                          .setWordKnow(wordInfo.wordId, 0)
                          .then((value) {
                        if (value == 'success') {
                          toggleMedneMedehgui.value =
                              !toggleMedneMedehgui.value;
                        }
                      });
                    }),
                    addVerticalSpace(15),
                    getMedneMedehgui(toggleMedneMedehgui.value == false, false,
                        () async {
                      //MEDEHGUI
                      UnitRepository()
                          .setWordKnow(wordInfo.wordId, 1)
                          .then((value) {
                        if (value == 'success') {
                          toggleMedneMedehgui.value =
                              !toggleMedneMedehgui.value;
                        }
                      });
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getMedneMedehgui(bool selected, bool medne, Function() whenTapped) {
    var borderColor = selected
        ? (medne
            ? const Color.fromRGBO(127, 208, 79, 1)
            : const Color.fromRGBO(235, 87, 87, 1))
        : Colors.grey;
    return InkWell(
      onTap: whenTapped,
      child: Container(
        height: 30,
        width: 130,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              medne ? Icons.done : Icons.close,
              color: borderColor,
              size: 22.0,
            ),
            Text(
              medne ? 'Мэднэ' : 'Мэдэхгүй',
              style: TextStyle(
                  fontFamily: 'Roboto',
                  color: selected
                      ? const Color.fromRGBO(51, 51, 51, 1)
                      : const Color.fromRGBO(51, 51, 51, 1).withOpacity(.5)),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: borderColor),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: selected
                  ? (medne
                      ? const Color.fromRGBO(127, 208, 79, .2)
                      : const Color.fromRGBO(255, 66, 66, .15))
                  : Colors.white,
              spreadRadius: 4,
              blurRadius: 5,
              offset: const Offset(0, 2), // changes position of shadow
            )
          ],
        ),
      ),
    );
  }
}
