import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/models/Unit/reading.dart';
import 'package:medlegten/pages/CoursePages/Unit_reading/reading_helper.dart';
import 'package:medlegten/pages/CoursePages/Unit_reading/reading_paragraph.dart';
import 'package:medlegten/pages/CoursePages/Unit_reading/sliver_header.dart';

class ReadingPage extends HookWidget {
  const ReadingPage(this.reading, {Key? key}) : super(key: key);

  final Reading reading;

  @override
  Widget build(BuildContext context) {
    final helper = useMemoized(() => ReadingHelper());
    final refreshNotifier = useState(false);
    final paragraphs = useMemoized(() => ReadingHelper.convert(reading));
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
                return SizedBox(
                  height: 40,
                  child: ReadingParagraph(
                    paragraphs[index],
                    (word, position) {
                      helper.word = word;
                      helper.position = position;
                      refreshNotifier.value = !refreshNotifier.value;
                    },
                  ),
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
