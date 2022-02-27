import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/models/Landing/last_seen.dart';
import 'package:medlegten/models/video/movie.dart';
import 'package:medlegten/models/video/payment_info.dart';
import 'package:medlegten/repositories/unit_repository.dart';
import 'package:medlegten/repositories/video_repository.dart';
import 'package:medlegten/utils/app_router.dart';
import 'package:medlegten/widgets/loader.dart';

// ignore: must_be_immutable
class LastSeenWidget extends HookWidget {
  LastSeenWidget({Key? key, this.lastSeen}) : super(key: key);

  LastSeen? lastSeen;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20, left: 10),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(2, 2), // changes position of shadow
            ),
          ],
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15))),
      child: ExpandablePanel(
        controller: ExpandableController(initialExpanded: true),
        theme: const ExpandableThemeData(
            tapBodyToCollapse: true,
            tapBodyToExpand: true,
            useInkWell: true,
            iconSize: 35,
            iconColor: colorPrimary,
            iconPadding: EdgeInsets.all(0),
            tapHeaderToExpand: true),
        header: SizedBox(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              "Сүүлд үзсэн",
              style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        collapsed: Container(),
        expanded: Column(
          children: [
            shadowContainer(),
            Container(
              margin: const EdgeInsets.all(15),
              child: getLastSeenItemWidget(
                  title: "Сүүлд уншсан",
                  imgUrl: lastSeen!.lastSeenArticle!.slideImageUrl,
                  text: lastSeen!.lastSeenArticle!.articleTitle,
                  context: context,
                  isArticle: true),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              child: getLastSeenItemWidget(
                  title: "Сүүлд үзсэн",
                  imgUrl: lastSeen!.lastSeenPPV!.imgUrl,
                  text: lastSeen!.lastSeenPPV!.contentName,
                  context: context,
                  isArticle: false),
            )
          ],
        ),
      ),
    );
  }

  Widget shadowContainer() {
    return Container(
      width: double.infinity,
      height: 15,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xff0D18F9).withOpacity(0.15),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
      ),
    );
  }

  Widget getLastSeenItemWidget(
      {String? title,
      String? imgUrl,
      String? text,
      BuildContext? context,
      bool? isArticle}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          style: const TextStyle(
              fontSize: 10,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal),
        ),
        const SizedBox(
          height: 5,
        ),
        Divider(
          color: const Color(0xffC7C9D9).withOpacity(0.2),
          thickness: 1,
          height: 1,
        ),
        const SizedBox(
          height: 5,
        ),
        GestureDetector(
          onTap: () async {
            if (isArticle!) {
              LoadingIndicator(context: context).showLoadingIndicator();
              UnitRepository()
                  .getArticleInfo(lastSeen?.lastSeenArticle?.articleId ?? "")
                  .then((value) {
                LoadingIndicator(context: context).hideLoadingIndicator();
                AutoRouter.of(context!).push(ArticleRoute(articleInfo: value!));
              }).catchError((onError) {
                LoadingIndicator(context: context).hideLoadingIndicator();
              });
            } else {
              List data = [];
              LoadingIndicator(context: context).showLoadingIndicator();
              try {
                data = await VideoRepository().getContentDetail(
                    contentId: lastSeen!.lastSeenPPV!.contentId);
                LoadingIndicator(context: context).hideLoadingIndicator();
              } catch (ex) {
                LoadingIndicator(context: context).hideLoadingIndicator();
              }

              List<Movie> movies = data[0];
              PaymentInfo paymentInfo = data[1];
              if (paymentInfo.isPurchased!) {
                AutoRouter.of(context!).push(VideoDetailRoute(
                    movies: movies,
                    url: movies[0].hostUrl!,
                    title: movies[0].contentName,
                    // isSerial: lastSeen.lastSeenPPV!.isSerial == "1" ? true : false
                    ));
              } else {
                AutoRouter.of(context!).push(
                  PaymentRoute(
                      courseInfo: null,
                      paymentType: "1002",
                      contendId: paymentInfo.productId,
                      isCourse: false,
                      paymentInfo: paymentInfo),
                );
              }
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.loose,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                        imgUrl ?? "",
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 5,
                child: Text(
                  text ?? "",
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                      color: Color(0xff333333),
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.normal),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
