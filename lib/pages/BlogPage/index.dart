import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/components/loading.dart';
import 'package:medlegten/models/article/article.dart';
import 'package:medlegten/pages/BlogPage/article_horizontal_page.dart';
import 'package:medlegten/repositories/article_repository.dart';
import 'package:medlegten/utils/app_router.dart';
import 'package:medlegten/widgets/TextButton.dart';

// ignore: must_be_immutable
class BlogPage extends HookWidget {
  BlogPage({Key? key}) : super(key: key);

  TextStyle typeStyle = const TextStyle(
      fontSize: 14, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: ArticleRepository().getArticle(),
      builder: (context, AsyncSnapshot<List<Article>> snapshot) {
        if (snapshot.hasData) {
          
          return ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: snapshot.data!.map((e) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20, top: 10, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          e.typeName,
                          textAlign: TextAlign.start,
                          style: typeStyle,
                        ),
                        TextButtonWidget(
                          onTap: () {
                            AutoRouter.of(context).push(
                              ArticleVerticalRoute(
                                  title: e.typeName,
                                  typeId: e.typeId),
                            );
                          },
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          text: "Бүгд",
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: ArticleHorizontalPage(
                      articles: e.articles,
                    ),
                  ),
                ],
              );
            }).toList(),
          );
        } else {
          return Container();
        }
      },
    ));
  }
}
