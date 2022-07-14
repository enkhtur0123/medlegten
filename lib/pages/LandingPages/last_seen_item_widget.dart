import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/models/Landing/last_seen.dart';
import 'package:medlegten/models/video/movie.dart';
import 'package:medlegten/models/video/payment_info.dart';
import 'package:medlegten/pages/LandingPages/last_seen_widget.dart';
import 'package:medlegten/repositories/unit_repository.dart';
import 'package:medlegten/repositories/video_repository.dart';
import 'package:medlegten/utils/app_router.dart';
import 'package:medlegten/widgets/loader.dart';

class LastSeenItemWidget extends HookWidget {
  const LastSeenItemWidget(
      {Key? key,
      this.lastSeen,
      this.title,
      this.imgUrl,
      this.text,
      this.isArticle,
      this.data,
      this.isLast = false})
      : super(key: key);

  final LastSeen? lastSeen;
  final String? title;
  final String? imgUrl;
  final String? text;
  final bool? isArticle;
  final dynamic data;
  final bool? isLast;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(left: 15, top: 8, right: 20, bottom: isLast! ? 8 : 0),
      child: Column(
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
          data != null
              ? GestureDetector(
                  onTap: () async {
                    if (isArticle!) {
                      LoadingIndicator(context: context).showLoadingIndicator();
                      UnitRepository()
                          .getArticleInfo(
                              lastSeen?.lastSeenArticle?.articleId ?? "")
                          .then((value) {
                        LoadingIndicator(context: context)
                            .hideLoadingIndicator();
                        AutoRouter.of(context)
                            .push(ArticleRoute(articleInfo: value!));
                      }).catchError((onError) {
                        LoadingIndicator(context: context)
                            .hideLoadingIndicator();
                      });
                    } else {
                      List data = [];
                      LoadingIndicator(context: context).showLoadingIndicator();
                      try {
                        data = await VideoRepository().getContentDetail(
                            contentId: lastSeen!.lastSeenPPV!.contentId);
                        LoadingIndicator(context: context)
                            .hideLoadingIndicator();
                      } catch (ex) {
                        LoadingIndicator(context: context)
                            .hideLoadingIndicator();
                      }

                      List<Movie> movies = data[0];
                      PaymentInfo paymentInfo = data[1];
                      if (paymentInfo.isPurchased!) {
                        AutoRouter.of(context).push(VideoDetailRoute(
                            movies: movies,
                            url: movies[0].hostUrl!,
                            title: movies[0].contentName,
                            isSerial: lastSeen!.lastSeenPPV!.isSerial == "1"
                                ? true
                                : false));
                      } else {
                        AutoRouter.of(context).push(
                          PaymentRoute(
                            courseInfo: null,
                            paymentType: "1002",
                            contendId: paymentInfo.productId,
                            isCourse: false,
                            paymentInfo: paymentInfo,
                          ),
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
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
              : emptyContainer()
        ],
      ),
    );
  }
}
