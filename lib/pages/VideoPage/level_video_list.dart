import 'package:flutter/material.dart';
import 'package:medlegten/models/video/event.dart';
import 'package:medlegten/pages/VideoPage/level_event_item.dart';
import 'package:medlegten/repositories/video_repository.dart';

// ignore: must_be_immutable
class LevelVideoListPage extends StatefulWidget {
  LevelVideoListPage(
      {Key? key,
      this.levelId,
      required this.categoryName,
      required this.isCategorySearch,
      this.categoryId})
      : super(key: key);
  String? levelId;
  String? categoryName;
  bool? isCategorySearch;
  String? categoryId;

  @override
  State<StatefulWidget> createState() {
    return LevelVideoListPageState();
  }
}

// ignore: must_be_immutable
class LevelVideoListPageState extends State<LevelVideoListPage> {
  int currentPageNumber = 0;
  static int pageSize = 10;
  bool loadMore = false;

  List<Event>? events = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName!),
      ),
      body: FutureBuilder<List<Event>>(
        future: !widget.isCategorySearch!
            ? VideoRepository().getLevelAllEvent(level_id: widget.levelId)
            : VideoRepository().categorySearch(
                categoryId: widget.categoryId,
                pageNumber: currentPageNumber,
                pageSize: pageSize),
        builder: (context, AsyncSnapshot<List<Event>?> snapshot) {
          if (snapshot.hasData) {
            events!.addAll(snapshot.data!);
            return NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (scrollInfo.metrics.pixels ==
                        scrollInfo.metrics.maxScrollExtent &&
                    !loadMore) {
                  currentPageNumber++;
                  onLoadMore();
                }
                return false;
              },
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: events!.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.width * 0.5,
                    child: LevelEventItem(
                      edgeInsets:
                          const EdgeInsets.only(left: 15, right: 15, top: 10),
                      event: events![index],
                    ),
                  );
                },
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Future<void> onLoadMore() async {
    loadMore = true;
    VideoRepository()
        .categorySearch(
            categoryId: widget.categoryId,
            pageNumber: currentPageNumber,
            pageSize: pageSize)
        .then((value) {
      events!.addAll(value);
      setState(() {
        loadMore = false;
      });
    }).catchError((onError) {
      setState(() {
        loadMore = false;
      });
    });
  }
}
