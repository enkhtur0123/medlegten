import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/models/article/article_item.dart';
import 'package:medlegten/utils/app_router.dart';
import 'package:medlegten/widgets/buttons/custom_inkwell_btn.dart';
import 'article_item_page.dart';

// ignore: must_be_immutable
class ArticleHorizontalPage extends HookWidget {
  ArticleHorizontalPage({Key? key, this.articles, this.typeName, this.typeId})
      : super(key: key);

  final List<ArticleItem>? articles;
  final String? typeName;
  final String? typeId;
  TextStyle typeStyle = const TextStyle(
      fontSize: 14, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold);
  PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.88);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      color: Colors.white,
      height: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: Container(
              margin:
                  const EdgeInsets.only(left: 20, top: 0, right: 40, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    typeName!,
                    textAlign: TextAlign.start,
                    style: typeStyle,
                  ),
                  CustomInkWellButton(
                    onTap: () {
                      AutoRouter.of(context).push(
                        ArticleVerticalRoute(title: typeName, typeId: typeId),
                      );
                    },
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    color: colorPrimary,
                    text: "Бүгд",
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 12,
            child: PageView.builder(
              padEnds: false,
              controller: pageController,
              scrollDirection: Axis.horizontal,
              itemCount: articles!.length,
              itemBuilder: (context, index) {
                return ArticleItemPage(
                  articleItem: articles![index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
