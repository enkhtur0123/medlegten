import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/components/loading.dart';
import 'package:medlegten/models/Unit/cue_word.dart';
import 'package:medlegten/pages/CoursePages/base/cue_wrapper.dart';
import 'package:medlegten/repositories/unit_repository.dart';

class CueWordWidget extends StatefulWidget {
  const CueWordWidget(this.word, {Key? key}) : super(key: key);
  final CWord word;

  @override
  _CueWordWidgetState createState() => _CueWordWidgetState();
}

class _CueWordWidgetState extends State<CueWordWidget> {
  @override
  Widget build(BuildContext context) {
    return body(context, widget.word);
  }

  Widget body(BuildContext context, CWord word) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            top: 20,
            left: MediaQuery.of(context).size.width * 0.06,
            child: Container(
              height: 220,
              width: MediaQuery.of(context).size.width * 0.88,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    color: const Color.fromRGBO(174, 177, 239, .3), width: 1),
              ),
              child: FutureBuilder<CueWord?>(
                future:
                    UnitRepository().getCueWord(word.wordValue), // async work
                builder:
                    (BuildContext context, AsyncSnapshot<CueWord?> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return const Loading();
                    default:
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return innerBottonSheetWidget(snapshot.data);
                      }
                  }
                },
              ),
            ),
          ),
          Positioned(
            top: 9.8,
            left: 40,
            child: Image.network(
              "https://www.medlegten.com/static/uploads/content/image_small/polygon3.jpg",
              fit: BoxFit.cover,
              width: 27.56,
              height: 11.48,
            ),
          ),
        ],
      ),
    );
  }

  Widget innerBottonSheetWidget(CueWord? cueWord) {
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
                const EdgeInsets.only(left: 12, top: 8, right: 12, bottom: 8),
            child: Text(
              cueWord.word,
              style: const TextStyle(
                  color: colorWhite, fontWeight: FontWeight.w700, fontSize: 16),
            ),
          ),
        ),
        IconButton(
          onPressed: () => {},
          icon: const Icon(
            Icons.volume_up_outlined,
            color: Color.fromRGBO(48, 53, 159, 1),
            size: 28.0,
          ),
        ),
        Expanded(child: Container()),
        IconButton(
          onPressed: () => {},
          icon: const Icon(
            Icons.bookmark_outline_sharp,
            color: Color.fromRGBO(48, 53, 159, 1),
            size: 28.0,
          ),
        ),
      ],
    ));

    if (cueWord.rootWordInfo.rootWord != null) {
      list.add(
        Row(
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
        list.add(
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                translation.trTypeShortName,
                style: const TextStyle(
                    color: Color.fromRGBO(48, 53, 159, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                translation.trText,
                style: const TextStyle(
                    color: Color.fromRGBO(48, 53, 159, .3),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        );
      }
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
        itemCount: list.length,
        separatorBuilder: (BuildContext context, int index) =>
            addVerticalSpace(1),
        itemBuilder: (context, index) => list[index],
      ),
    );
  }
}
