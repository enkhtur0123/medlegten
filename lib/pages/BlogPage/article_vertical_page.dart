import 'package:flutter/material.dart';
import 'package:medlegten/models/article/article_item.dart';
import 'package:medlegten/pages/BlogPage/article_vertical_item_page.dart';
import 'package:medlegten/repositories/article_repository.dart';

// ignore: must_be_immutable
class ArticleVerticalPage extends StatefulWidget {
  ArticleVerticalPage(
      {Key? key,
      this.title,
      this.typeId,
      this.isArticleSearch = false,
      this.searchValue})
      : super(key: key);
  String? title;
  String? typeId;
  bool? isArticleSearch;
  String? searchValue;
  @override
  State<StatefulWidget> createState() {
    return ArticleVerticalPageState();
  }
}

// ignore: must_be_immutable
class ArticleVerticalPageState extends State<ArticleVerticalPage> {
  int pageNumber = 0;
  int pageSize = 10;
  List<ArticleItem>? articles = [];
  bool isLoadMore = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      onLoadMore();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: articles!.isNotEmpty
          ? Container(
              margin: const EdgeInsets.all(20),
              child: NotificationListener(
                onNotification: (ScrollNotification scrollInfo) {
                  if (scrollInfo.metrics.pixels ==
                          scrollInfo.metrics.maxScrollExtent &&
                      !isLoadMore) {
                    pageNumber++;
                    isLoadMore = true;
                    widget.isArticleSearch = widget.isArticleSearch;
                    onLoadMore();
                    return true;
                  }
                  return false;
                },
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: articles!.length,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ArticleVerticalItemPage(
                      articleItem: articles![index],
                    );
                  },
                ),
              ),
            )
          : Container(),
    );
  }

  void onLoadMore() async {
    if (!widget.isArticleSearch!) {
      articles!.addAll(await ArticleRepository().getAllArticle(
          typeId: widget.typeId, pageNumber: pageNumber, pageSize: pageSize));
    } else {
      articles!.addAll(await ArticleRepository().searchArticle(
          searchValue: widget.searchValue,
          pageNumber: pageNumber,
          pageSize: pageSize));
    }
    isLoadMore = false;
    setState(() {});
  }
}
