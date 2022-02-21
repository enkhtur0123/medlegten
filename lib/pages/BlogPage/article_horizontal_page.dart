import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/models/article/article_item.dart';

import 'article_item_page.dart';

// ignore: must_be_immutable
class ArticleHorizontalPage extends HookWidget {
  ArticleHorizontalPage({Key? key, this.articles}) : super(key: key);

  final List<ArticleItem>? articles;

  PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.88);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      color: Colors.white,
      height: MediaQuery.of(context).size.width * 0.5,
      child: PageView.builder(
        padEnds: false,
        controller: pageController,
        scrollDirection: Axis.horizontal,
        itemCount: articles!.length,
        itemBuilder: (context, index) {
          return ArticleItemPage(articleItem:articles![index]);
        },
      ),
    );
  }

  
}
