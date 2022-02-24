import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/components/loading.dart';
import 'package:medlegten/models/Landing/last_seen.dart';
import 'package:medlegten/pages/LandingPages/promotion_list.dart';
import 'package:medlegten/repositories/landing_repository.dart';

class LandingHome extends ConsumerStatefulWidget {
  const LandingHome({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return LandingHomeState();
  }
}

class LandingHomeState extends ConsumerState<LandingHome> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: LandingRepository().getLastSeen(),
        builder: (BuildContext context, AsyncSnapshot<LastSeen> snapShot) {
          if (snapShot.hasData) {
            return Container(
              margin: const EdgeInsets.only(top: 10, left: 20),
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  PromotionList(
                    promoList: snapShot.data!.promotions,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                2, 2), // changes position of shadow
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
                      header: Container(
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
                                imgUrl: snapShot
                                    .data!.lastSeenArticle.slideImageUrl,
                                text: snapShot
                                    .data!.lastSeenArticle.articleTitle),
                          ),
                          Container(
                            margin: const EdgeInsets.all(15),
                            child: getLastSeenItemWidget(
                                title: "Сүүлд үзсэн",
                                imgUrl: snapShot.data!.lastSeenPPV.imgUrl,
                                text: snapShot.data!.lastSeenPPV.contentName),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          } else {
            return const Loading();
          }
        });
  }

  Widget shadowContainer() {
    return Container(
      width: double.infinity,
      height: 15,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
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

  Widget getLastSeenItemWidget({String? title, String? imgUrl, String? text}) {
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
        Row(
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
                      imgUrl!,
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
                text!,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                    color: Color(0xff333333),
                    fontSize: 14,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal),
              ),
            )
          ],
        )
      ],
    );
  }
}
