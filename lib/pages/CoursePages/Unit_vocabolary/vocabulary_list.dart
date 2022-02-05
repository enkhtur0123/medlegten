import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/components/loading.dart';
import 'package:medlegten/models/Landing/course_unit.dart';
import 'package:medlegten/models/Unit/unit_vocabulary.dart';
import 'package:medlegten/models/Unit/unit_vocabulary_word.dart';
import 'package:medlegten/pages/CoursePages/Unit_vocabolary/vocabulary_card.dart';
import 'package:medlegten/repositories/unit_repository.dart';
import 'package:medlegten/utils/global.dart';

class VocabularyListPage extends HookWidget {
  final CourseUnit unit;
  const VocabularyListPage(this.unit, {Key? key}) : super(key: key);

  Future<UnitVocabulary> fetchData() async {
    var result = await UnitRepository().getUnitVocabulary(unit.unitId);
    return result!;
  }

  List<UnitVocabularyWord> getBookMarked(
      List<UnitVocabularyWord> words, bool isBookmarked) {
    if (isBookmarked) {
      return words.where((element) => element.bookMarked == true).toList();
    } else {
      return words;
    }
  }

  @override
  Widget build(BuildContext context) {
    final future = useMemoized(fetchData);
    final snapshot = useFuture(future);
    final isBookmarked = useState(false);
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: ColorTable.color255_255_255,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          addVerticalSpace(20),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            getButton('All words', isBookmarked.value == false, isBookmarked),
            getButton(
                'Selected words', isBookmarked.value == true, isBookmarked)
          ]),
          addVerticalSpace(10),
          const Divider(
            color: Color.fromRGBO(199, 201, 217, .2),
            thickness: 1,
          ),
          addVerticalSpace(10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: snapshot.hasData
                  ? getListView(snapshot.data!.words, isBookmarked.value)
                  : const Loading(),
            ),
          ),
        ],
      ),
    );
  }

  Widget getListView(List<UnitVocabularyWord> words, bool isBookmarked) {
    var filteredList = getBookMarked(words, isBookmarked);
    return ListView.builder(
      itemCount: filteredList.length,
      itemBuilder: (context, index) {
        return VocabularyCart(filteredList[index]);
      },
    );
  }

  Widget getButton(
      String caption, bool isSelected, ValueNotifier<bool> onSelected) {
    return isSelected
        ? SizedBox(
            width: GlobalValues.getWidthRelativeToScreen(
                40), // GlobalValues.screenWidth / 2.4,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(caption,
                  style: const TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500)),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromRGBO(48, 53, 159, 1),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                )),
                elevation: 5.0,
              ),
            ),
          )
        : InkWell(
            onTap: () {
              onSelected.value = !onSelected.value;
            },
            child: SizedBox(
              width: GlobalValues.getWidthRelativeToScreen(40),
              child: Center(
                child: Text(
                  caption,
                  style: const TextStyle(
                      fontFamily: 'Roboto',
                      color: Color.fromRGBO(48, 53, 159, 0.5),
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          );
  }
}
