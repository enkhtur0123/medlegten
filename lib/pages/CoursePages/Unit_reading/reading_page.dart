import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/models/Unit/reading.dart';
import 'package:medlegten/pages/CoursePages/Unit_reading/reading_helper.dart';
import 'package:medlegten/pages/CoursePages/Unit_reading/reading_paragraph.dart';
import 'package:medlegten/pages/CoursePages/Unit_reading/sliver_header.dart';
import 'package:medlegten/pages/CoursePages/base/base_cue_helper.dart';
import 'package:medlegten/pages/CoursePages/base/cue_word_widget.dart';
import 'package:medlegten/utils/global.dart';

class ReadingPage extends HookWidget {
  const ReadingPage(this.reading, {Key? key}) : super(key: key);

  final Reading reading;

  @override
  Widget build(BuildContext context) {
    final helper = useMemoized(() => ReadingHelper());
    final refreshNotifier = useState(false);

    useEffect(() {
      helper.paragraphs = ReadingHelper.convert(reading);
      return null;
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
                var paragraph = helper.paragraphs[index];
                if (!helper.valueKeys.containsKey(paragraph)) {
                  helper.valueKeys[paragraph] = 0;
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    height: BaseCueHelper().getMaxHeight(
                        [paragraph],
                        true,
                        const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                        helper.width),
                    child: ReadingParagraph(paragraph, (word, position) {
                      helper.lastIndex = index;
                      wordCallBack(word, position);
                      refreshNotifier.value = !refreshNotifier.value;
                      if (helper.lastIndex > -1 && helper.lastIndex != index) {
                        helper.valueKeys[helper.paragraphs[helper.lastIndex]] =
                            helper.valueKeys[
                                    helper.paragraphs[helper.lastIndex]]! +
                                1;
                      }
                    }, (paragraph) {},
                        key: ValueKey<int>(helper.valueKeys[paragraph]!)),
                  ),
                );
              },
              childCount: helper.paragraphs.length,
            ),
          ),
        ],
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
          //color: Colors.white60,
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
