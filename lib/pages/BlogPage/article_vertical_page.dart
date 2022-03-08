import 'package:flutter/material.dart';
import 'package:medlegten/models/article/article_item.dart';
import 'package:medlegten/pages/BlogPage/article_item_page.dart';
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
  int pageNumber = 1;
  int pageSize = 10;
  List<ArticleItem>? articles=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: FutureBuilder(
        future: !widget.isArticleSearch!
            ? ArticleRepository().getAllArticle(
                typeId: widget.typeId,
                pageNumber: pageNumber,
                pageSize: pageSize)
            : ArticleRepository().searchArticle(
                searchValue: widget.searchValue,
                pageNumber: pageNumber,
                pageSize: pageSize),
        builder: (context, AsyncSnapshot<List<ArticleItem>> snapshot) {
          if (snapshot.hasData) {
            articles!.addAll(snapshot.data!);
            return Container(
              margin: const EdgeInsets.all(20),
              child: NotificationListener(
                onNotification: (ScrollNotification scrollInfo) {
                  if (scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent) {
                    onLoadMore();
                  }
                  return false;
                },
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: articles!.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ArticleItemPage(
                      articleItem: articles![index],
                    );
                  },
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  void onLoadMore() {}
}
