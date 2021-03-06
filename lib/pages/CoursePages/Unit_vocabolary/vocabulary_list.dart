import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/models/Landing/course_unit.dart';
import 'package:medlegten/models/Unit/unit_vocabulary_word.dart';
import 'package:medlegten/pages/CoursePages/Unit_vocabolary/vocabulary_card.dart';
import 'package:medlegten/pages/CoursePages/base/unit_appbar.dart';
import 'package:medlegten/repositories/unit_repository.dart';
import 'package:medlegten/utils/global.dart';

class VocabularyListPage extends StatefulWidget {
  const VocabularyListPage(this.unit, this.unitTitle, {Key? key})
      : super(key: key);
  final CourseUnit unit;
  final String unitTitle;
  @override
  _VocabularyListPageState createState() => _VocabularyListPageState();
}

class _VocabularyListPageState extends State<VocabularyListPage> {
  static const _pageSize = 20;
  late final isBookmarked = ValueNotifier<bool>(true)..addListener(_listener);

  void _listener() {
    _pagingController.refresh();
    setState(() {});
  }

  // List<UnitVocabularyWord> getBookMarked(
  //     List<UnitVocabularyWord> words, bool isBookmarked) {
  //   if (isBookmarked) {
  //     return words.where((element) => element.bookMarked == true).toList();
  //   } else {
  //     return words;
  //   }
  // }

  final PagingController<int, UnitVocabularyWord> _pagingController =
      PagingController(firstPageKey: 1);

  Future<void> fetchPage(int pageKey) async {
    try {
      final vocabulary = await UnitRepository().getUnitVocabulary(
          widget.unit.unitId, pageKey, _pageSize, isBookmarked.value ? 1 : 0);
      if (vocabulary != null) {
        final isLastPage = vocabulary.words.length < _pageSize;
        if (isLastPage) {
          _pagingController.appendLastPage(vocabulary.words);
        } else {
          final nextPageKey = pageKey + 1;
          _pagingController.appendPage(vocabulary.words, nextPageKey);
        }
      } else {
        _pagingController.appendLastPage(<UnitVocabularyWord>[]);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  void initState() {
    isBookmarked.value = false;
    _pagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey);
    });
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    isBookmarked.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTable.color255_255_255,
      body: Stack(children: [
        Positioned(
          top: unitHeaderHeight,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - unitHeaderHeight,
          child: body(),
        ),
        Positioned(
          width: MediaQuery.of(context).size.width,
          height: unitHeaderHeight + 8,
          child: UnitAppBar(widget.unitTitle),
        ),
      ]),
    );
  }

  Widget body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        addVerticalSpace(20),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          getButton('All words', isBookmarked.value == false, isBookmarked),
          getButton('Selected words', isBookmarked.value == true, isBookmarked)
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
            child: PagedListView<int, UnitVocabularyWord>(
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<UnitVocabularyWord>(
                  itemBuilder: (context, item, index) => VocabularyCart(item)),
            ),
          ),
        ),
      ],
    );
  }

  Widget getButton(
      String caption, bool isSelected, ValueNotifier<bool> onSelected) {
    return isSelected
        ? SizedBox(
            width: GlobalValues.getWidthRelativeToScreen(
                20), // GlobalValues.screenWidth / 2.4,
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
              width: GlobalValues.getWidthRelativeToScreen(20),
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
