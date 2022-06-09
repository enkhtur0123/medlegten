import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/models/article/article_item.dart';
import 'package:medlegten/repositories/unit_repository.dart';
import 'package:medlegten/utils/app_router.dart';
import 'package:medlegten/widgets/icon_with_text_widget.dart';
import 'package:medlegten/widgets/loader.dart';

// ignore: must_be_immutable
class ArticleVerticalItemPage extends HookWidget {
  ArticleVerticalItemPage({Key? key, this.articleItem}) : super(key: key);

  ArticleItem? articleItem;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        LoadingIndicator(context: context).showLoadingIndicator();
        UnitRepository().getArticleInfo(articleItem!.articleId).then((value) {
          LoadingIndicator(context: context).hideLoadingIndicator();
          AutoRouter.of(context).push(ArticleRoute(articleInfo: value!));
        }).catchError((onError) {
          LoadingIndicator(context: context).hideLoadingIndicator();
        });
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(2, 2), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 4,
              fit: FlexFit.tight,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.width * 0.35,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image:
                        CachedNetworkImageProvider(articleItem!.slideImageUrl),
                  ),
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 6,
              child: Container(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getTitleWidget(
                        categoryName: articleItem!.categoryName,
                        createdDate: articleItem!.createdDate),
                    const SizedBox(
                      height: 20,
                    ),
                    Flexible(
                      flex: 3,
                      fit: FlexFit.loose,
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          articleItem!.articleTitle,
                          style: const TextStyle(
                              color: Color(0xff333333),
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal,
                              fontSize: 12),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: const Color(0xffC7C9D9).withOpacity(0.2),
                      height: 1,
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 3,
                          child: IconWithTextWidget(
                            iconData: Icons.remove_red_eye_outlined,
                            text: articleItem!.viewCount.toString(),
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          flex: 3,
                          child: IconWithTextWidget(
                            iconData: Icons.favorite_outline_outlined,
                            text: articleItem!.likeCount.toString(),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getTitleWidget({String? categoryName, String? createdDate}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          categoryName!,
          style: TextStyle(
              fontSize: 10,
              color: const Color(0xff4F4F4F).withOpacity(0.5),
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal),
        ),
        Text(createdDate!,
            style: TextStyle(
                fontSize: 10,
                color: const Color(0xff4F4F4F).withOpacity(0.5),
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.normal))
      ],
    );
  }

  viewWithLikeWidget({IconData? iconData, String? text}) {
    return Flexible(
      fit: FlexFit.tight,
      flex: 3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            iconData,
            color: const Color(0xff4F4F4F),
            size: 18,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text!,
            style: const TextStyle(
                color: Color(0xff4F4F4F),
                fontSize: 10,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.normal),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}