import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/models/Unit/reading.dart';
import 'package:medlegten/pages/CoursePages/Unit_reading/reading_helper.dart';
import 'package:medlegten/pages/CoursePages/Unit_reading/reading_paragraph.dart';
import 'package:medlegten/pages/CoursePages/Unit_reading/sliver_header.dart';
import 'package:medlegten/pages/CoursePages/base/cue_word_widget.dart';
import 'package:medlegten/pages/CoursePages/base/cue_wrapper.dart';

class ReadingPage extends HookWidget {
  const ReadingPage(this.reading, {Key? key}) : super(key: key);

  final Reading reading;

  @override
  Widget build(BuildContext context) {
    //final helper = useMemoized(() => ReadingHelper());
    final refreshNotifier = useState(false);
    final paragraphs = useMemoized(() => ReadingHelper.convert(reading));
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final valueKeys = useMemoized(() => <CParagraph, int>{});
    final lastIndex = useMemoized(() => <int>[0]);

    useEffect(() {
      lastIndex[0] = -1;
    }, const []);

    return Scaffold(
      appBar: AppBar(),
      backgroundColor: ColorTable.color255_255_255,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: MyDynamicHeader(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                var paragraph = paragraphs[index];
                if (!valueKeys.containsKey(paragraph)) {
                  valueKeys[paragraph] = 0;
                }
                return SizedBox(
                  height: 40,
                  child: ReadingParagraph(paragraph, (word, position) {
                    if (word != null) {
                      lastIndex[0] = index;
                      var isTop = screenHeight - position.top > cueWidgetHeight;
                      SmartDialog.showAttach(
                        isLoadingTemp: false,
                        targetContext: null,
                        target: Offset(
                            10,
                            isTop == false
                                ? position.top - cueWidgetHeight - 30
                                : position.top + 30),
                        //isPenetrateTemp: true,
                        //alignmentTemp: Alignment.bottomCenter,
                        useSystem: false,
                        isUseAnimationTemp: false,
                        maskColorTemp: Colors.transparent,
                        widget: SizedBox(
                          height: cueWidgetHeight + 20,
                          width: screenWidth,
                          //color: Colors.white60,
                          child: CueWordWidget(word,
                              ppointerPosition: position,
                              isshadow: true,
                              istop: isTop),
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
                    refreshNotifier.value = !refreshNotifier.value;
                    if (lastIndex[0] > -1 && lastIndex[0] != index) {
                      valueKeys[paragraphs[lastIndex[0]]] =
                          valueKeys[paragraphs[lastIndex[0]]]! + 1;
                    }
                  }, key: ValueKey<int>(valueKeys[paragraph]!)),
                );
              },
              childCount: paragraphs.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget maxExtentProtoType() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          width: double.infinity,
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Squid Game Facts That Make You Appreciate The Show Even More',
                    style: TextStyle(
                        color: colorPrimary,
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                ),
              ),
              IconButton(
                onPressed: () => {},
                icon: const Icon(
                  Icons.bookmark_outline_sharp,
                  color: Color.fromRGBO(48, 53, 159, 1),
                  size: 28.0,
                ),
              ),
            ],
          ),
        ),
        Image.asset(
          'assets/SliverImage.png',
          fit: BoxFit.cover,
        ),
        addVerticalSpace(10),
        const Divider(thickness: 1, color: Colors.black12),
      ],
    );
  }
}
