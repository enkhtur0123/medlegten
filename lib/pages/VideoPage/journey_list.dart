import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/models/video/journey.dart';
import 'package:medlegten/models/video/movie.dart';
import 'package:medlegten/models/video/payment_info.dart';
import 'package:medlegten/repositories/video_repository.dart';
import 'package:medlegten/utils/app_router.dart';
import 'package:medlegten/utils/time_convert_helper.dart';
import 'package:medlegten/widgets/icon_with_text_widget.dart';
import 'package:medlegten/widgets/loader.dart';

// ignore: must_be_immutable
class JourneyPage extends HookWidget {
  JourneyPage({Key? key, this.journeys, this.isHome = false}) : super(key: key);
  List<Journey>? journeys;

  final bool? isHome;

  PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.85);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            fit: FlexFit.loose,
            child: Container(
              margin: const EdgeInsets.only(top: 15, bottom: 0, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Санал болгох',
                    style: TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 12,
            child: Container(
              alignment: Alignment.topLeft,
              width: double.infinity,
              height: MediaQuery.of(context).size.width * 0.5,
              child: PageView.builder(
                pageSnapping: true,
                padEnds: false,
                controller: pageController,
                scrollDirection: Axis.horizontal,
                itemCount: journeys!.length,
                itemBuilder: (context, position) {
                  return GestureDetector(
                    onTap: () async {
                      List data = [];
                      LoadingIndicator(context: context).showLoadingIndicator();
                      try {
                        data = await VideoRepository().getContentDetail(
                            contentId: !isHome!
                                ? journeys![position].eventId
                                : journeys![position].eventId);
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
                            isSerial: journeys![position].isSerial == "1"
                                ? true
                                : false));
                      } else {
                        AutoRouter.of(context).push(
                          PaymentRoute(
                              courseInfo: null,
                              paymentType: "1002",
                              contendId: paymentInfo.productId,
                              isCourse: false,
                              paymentInfo: paymentInfo),
                        );
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 7,
                            spreadRadius: 3,
                            offset: const Offset(2.0, 2.0),
                          )
                        ],
                        color: Colors.white,
                      ),
                      margin:
                          const EdgeInsets.only(top: 20, bottom: 15, left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 5,
                            child: Container(
                              padding: const EdgeInsets.only(
                                  top: 15, left: 15, bottom: 15),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                child: CachedNetworkImage(
                                  imageUrl: journeys![position].imgUrl ?? "",
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.width * 0.35,
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 7,
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.only(
                                        top: 15,
                                        bottom: 4,
                                        left: 10,
                                      right: 15,
                                    ),
                                    child: AutoSizeText(
                                      journeys![position].eventName!,
                                      textAlign: TextAlign.left,
                                      maxLines: 3,
                                    ),
                                  ),
                                  Container(
                                    height: 64,
                                    width: double.infinity,
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 5, left: 10, right: 15),
                                    child: Text(
                                      "Шинэ үг: ${int.parse(journeys![position].vocabularyCount!) - int.parse(journeys![position].vocabularyKnow!)}",
                                      style: const TextStyle(
                                        color: Color(0xff828282),
                                        fontSize: 15,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.only(
                                        top: 4, bottom: 0, left: 10, right: 15),
                                    child: Row(
                                      children: [
                                        Flexible(
                                          fit: FlexFit.tight,
                                          child: IconWithTextWidget(
                                              iconData: Icons.access_time_sharp,
                                              fontSize: 10,
                                              text: journeys![position]
                                                              .runTime !=
                                                          null &&
                                                      journeys![position]
                                                              .runTime !=
                                                          ""
                                                  ? TimeConvertHelper()
                                                      .timeConvert(
                                                      time: int.parse(
                                                          journeys![position]
                                                              .runTime!),
                                                    )
                                                  : ""),
                                        ),
                                        Flexible(
                                          fit: FlexFit.tight,
                                          child: IconWithTextWidget(
                                            iconData: CupertinoIcons.layers_alt,
                                            text: journeys![position]
                                                .vocabularyCount,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 0, left: 10, right: 15),
                                    width: double.infinity,
                                    child: IconWithTextWidget(
                                      iconData: Icons.category_outlined,
                                      text: journeys![position].categoryName,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
