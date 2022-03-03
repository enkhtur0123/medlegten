import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/models/Landing/article_info.dart';

import 'package:medlegten/pages/CoursePages/Unit_reading/reading_paragraph.dart';
import 'package:medlegten/pages/CoursePages/base/cue_word_widget.dart';
import 'package:medlegten/pages/CoursePages/base/cue_wrapper.dart';
import 'package:medlegten/pages/CoursePages/base/unit_appbar.dart';
import 'package:medlegten/repositories/unit_repository.dart';
import 'package:medlegten/utils/global.dart';
import 'dart:math' as math;
import 'article_helper.dart';
import 'article_translate.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage(
    this.articleInfo, {
    Key? key,
  }) : super(key: key);

  final ArticleInfo articleInfo;
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  late ArticleHelper helper;
  CParagraph? selectedParagraph;
  late bool isShowGrammar;
  late bool isWidgetIsShown;
  int currentCarouselIndex = 0;
  bool isLiked = false;
  int likeAdd = 0;
  late final refreshView = ValueNotifier<bool>(false)
    ..addListener(() {
      setState(() {});
    });

  @override
  void initState() {
    isLiked = widget.articleInfo.isLiked;
    if (isLiked) {
      likeAdd = 0;
    }
    isShowGrammar = false;
    isWidgetIsShown = false;
    helper = ArticleHelper();
    helper.paragraphs = ArticleHelper.convert(widget.articleInfo);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
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
          child: UnitAppBar(
            'MEDLEGTEN',
            isCompleted: null,
          ),
        ),
      ]),
    );
  }

  Widget body() {
    List<Widget> widgetList = [];
    isWidgetIsShown = false;
    for (int i = 0; i < helper.paragraphs.length; i++) {
      var paragraph = helper.paragraphs[i];
      if (!helper.valueKeys.containsKey(paragraph)) {
        helper.valueKeys[paragraph] = 0;
      }

      if (isShowGrammar &&
          selectedParagraph != null &&
          paragraph.ordering == selectedParagraph!.ordering) {
        widgetList.add(childWidget(paragraph, i, true));
        widgetList.add(ArticleTranslate(paragraph));
        isShowGrammar = false;
        isWidgetIsShown = true;
      } else {
        widgetList.add(childWidget(paragraph, i, false));
      }
    }
    if (widgetList.length < 20) {
      widgetList.add(const SizedBox(
        width: double.infinity,
        height: 100,
      ));
    }

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        AspectRatio(
          aspectRatio: 3 / 2,
          child: SizedBox(
            width: double.infinity,
            child: Stack(
              children: [
                CarouselSlider.builder(
                  itemCount: widget.articleInfo.slideImages.length,
                  itemBuilder: (ctx, index, realIdx) {
                    return FittedBox(
                      fit: BoxFit.fill,
                      child: Image.network(
                        widget.articleInfo.slideImages[index].slideImageUrl,
                      ),
                    );
                  },
                  options: CarouselOptions(
                      autoPlay: false,
                      enlargeCenterPage: false,
                      aspectRatio: 3 / 2,
                      viewportFraction: 1.0,
                      onPageChanged: (index, reason) {
                        currentCarouselIndex = int.parse(widget
                                .articleInfo.slideImages[index].ordering) -
                            1;
                        setState(() {});
                      }),
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.articleInfo.slideImages.map((entry) {
                      return Container(
                        width: 12.0,
                        height: 12.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(
                                currentCarouselIndex ==
                                        int.parse(entry.ordering) - 1
                                    ? 1
                                    : 0.5)),
                      );
                    }).toList(),
                  ),
                  addVerticalSpace(5)
                ]),
              ],
            ),
          ),
        ),
        statistikWidget(),
        const Divider(thickness: 1, color: Color.fromRGBO(199, 201, 217, .2)),
        articleTitle(),
        Expanded(
            child: ListView.builder(
          padding: const EdgeInsets.all(0),
          shrinkWrap: true,
          addAutomaticKeepAlives: true,
          itemCount: widgetList.length,
          itemBuilder: (context, index) {
            return widgetList[index];
          },
        )),
        bottomLike()
      ],
    );
  }

  Widget bottomLike() {
    return Container(
      padding: const EdgeInsets.only(bottom: 10, top: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
        ),
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
        ),
      ),
      child: Center(
        child: SizedBox(
          height: 52,
          width: 180, // <-- match_parent
          child: ElevatedButton(
            style: TextButton.styleFrom(
              backgroundColor: const Color.fromRGBO(101, 115, 219, 1),
              primary: Colors.black87,
              splashFactory: InkRipple.splashFactory,
              elevation: 5,
              minimumSize: const Size(88, 36),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
              ),
            ),
            onPressed: () {
              UnitRepository()
                  .setArticleLike(widget.articleInfo.articleId, isLiked ? 1 : 0)
                  .then((value) {
                if (value == 'success') {
                  isLiked = !isLiked;
                  if (widget.articleInfo.isLiked) {
                    likeAdd = isLiked ? 0 : -1;
                  } else {
                    likeAdd = isLiked ? 1 : 0;
                  }
                  setState(() {});
                }
              });
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: Colors.white,
                  size: 30,
                ),
                const SizedBox(width: 20),
                const Text(
                  'Хадгалах',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget articleTitle() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        child: Center(
            child: Text(widget.articleInfo.articleTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: colorPrimary))));
  }

  Widget statistikWidget() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // CachedNetworkImage(
          //   imageUrl: widget.articleInfo.categoryIcon,
          //   imageBuilder: (context, imageProvider) => Container(
          //     decoration: BoxDecoration(
          //       image: DecorationImage(
          //         image: imageProvider,
          //         fit: BoxFit.fill,
          //       ),
          //     ),
          //   ),
          //   placeholder: (context, url) => const CircularProgressIndicator(),
          //   errorWidget: (context, url, error) => const Icon(
          //     Icons.error,
          //     color: Color(0xff4F4F4F),
          //     size: 20,
          //   ),
          //   width: 20,
          //   height: 20,
          // ),
          const Icon(
            Icons.folder_open,
            color: Color(0xff4F4F4F),
            size: 20,
          ),
          addHorizontalSpace(8),
          Text(
            widget.articleInfo.categoryName,
            style: textStyle,
          ),
          addHorizontalSpace(16),
          const Icon(
            Icons.remove_red_eye,
            color: Color(0xff4F4F4F),
            size: 20,
          ),
          addHorizontalSpace(8),
          Text(
            '${widget.articleInfo.viewCount} views',
            style: textStyle,
          ),
          addHorizontalSpace(16),
          const Icon(
            Icons.favorite_outline_outlined,
            color: Color(0xff4F4F4F),
            size: 20,
          ),
          addHorizontalSpace(8),
          Text(
            '${int.parse(widget.articleInfo.likeCount) + likeAdd} likes',
            style: textStyle,
          )
        ],
      ),
    );
  }

  var textStyle = const TextStyle(
      color: Color(0xff4F4F4F),
      fontSize: 15,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal);

  Widget childWidget(CParagraph paragraph, int index, bool selectParagraph) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: ReadingParagraph(
          paragraph,
          (word, position) {
            wordCallBack(word, position);
            if (helper.lastIndex > -1 && helper.lastIndex != index) {
              helper.valueKeys[helper.paragraphs[helper.lastIndex]] =
                  helper.valueKeys[helper.paragraphs[helper.lastIndex]]! + 1;
            }
            helper.lastIndex = index;
            refreshView.value = !refreshView.value;
          },
          (paragraph) {
            selectedParagraph = paragraph;
          },
          tailWidget(selectParagraph),
          (paragraph) {
            callBackParagraph(paragraph);
          },
          selectParagraph,
          const Color.fromRGBO(51, 5, 51, 1),
          key: ValueKey<int>(helper.valueKeys[paragraph]!)), //
    );
  }

  callBackParagraph(CParagraph? _paragraph) {
    CParagraph? paragraph;
    if (_paragraph == null) {
      if (selectedParagraph != null) {
        paragraph = selectedParagraph!;
      }
    } else {
      paragraph = _paragraph;
    }
    if (paragraph != null) {
      if (isWidgetIsShown) {
        if (selectedParagraph == paragraph) {
          isShowGrammar = false;
        } else {
          isShowGrammar = true;
          helper.valueKeys[selectedParagraph]! + 1;
          selectedParagraph = paragraph;
        }
      } else {
        isShowGrammar = true;
        selectedParagraph = paragraph;
      }
      helper.valueKeys[paragraph]! + 1;
      refreshView.value = !refreshView.value;
    }
  }

  Widget tailWidget(bool selected) {
    return SizedBox(
      height: 20,
      width: 20,
      child: Transform.rotate(
        angle: 90 * math.pi / 180,
        child: Icon(Icons.call_made,
            size: 20,
            color:
                selected ? colorPrimary : const Color.fromRGBO(51, 5, 51, 1)),
        //key: UniqueKey(),
      ),
    );
  }

  void wordCallBack(word, position) {
    if (word != null) {
      var isTop = GlobalValues.screenHeight - position.top > 220;
      SmartDialog.showAttach(
        isLoadingTemp: false,
        targetContext: null,
        target: Offset(
            10, isTop == false ? position.top - 220 - 30 : position.top + 30),
        //isPenetrateTemp: true,
        //alignmentTemp: Alignment.bottomCenter,
        useSystem: false,
        isUseAnimationTemp: false,
        maskColorTemp: Colors.transparent,
        widget: SizedBox(
          height: 220 + 20,
          width: GlobalValues.getWidthRelativeToScreen(51),
          child: CueWordWidget(word,
              ppointerPosition: position, isshadow: true, istop: isTop),
        ),
      );
      // showDialog(
      //     context: context,
      //     barrierColor: Colors.transparent,
      //     barrierDismissible: true,
      //     builder: (BuildContext context) {
      //       return ReadingPopUpDialog(word, position);
      //     });
    }
  }
}
