import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/models/article/article_item.dart';
import 'package:medlegten/pages/BlogPage/article_item_page.dart';
import 'package:medlegten/repositories/article_repository.dart';

// ignore: must_be_immutable
class ArticleVerticalPage extends HookWidget {
  ArticleVerticalPage({Key? key, this.title, this.typeId}) : super(key: key);
  String? title;
  String? typeId;

  int pageNumber = 1;
  int pageSize = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: FutureBuilder(
          future: ArticleRepository().getAllArticle(
              typeId: typeId, pageNumber: pageNumber, pageSize: pageSize),
          builder: (context, AsyncSnapshot<List<ArticleItem>> snapshot) {
            if (snapshot.hasData) {
              return Container(
                margin: const EdgeInsets.all(20),
                child: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    children: snapshot.data!.map((e) {
                      return ArticleItemPage(
                        articleItem: e,
                      );
                    }).toList(),
                  
              ));
            } else {
              return Container();
            }
          },
        ));
  }
}
