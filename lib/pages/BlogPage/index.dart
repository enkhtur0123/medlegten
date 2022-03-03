import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/models/article/article.dart';
import 'package:medlegten/pages/BlogPage/article_horizontal_page.dart';
import 'package:medlegten/repositories/article_repository.dart';

// ignore: must_be_immutable
class BlogPage extends HookWidget {
  BlogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: ArticleRepository().getArticle(),
      builder: (context, AsyncSnapshot<List<Article>> snapshot) {
        if (snapshot.hasData) {
          return Container(
            margin: const EdgeInsets.only(top: 15),
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: snapshot.data!.map((e) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(5),
                      child: ArticleHorizontalPage(
                        articles: e.articles,
                        typeId: e.typeId,
                        typeName: e.typeName,
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          );
        } else {
          return Container();
        }
      },
    ));
  }
}
