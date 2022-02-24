import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/common/colors.dart';

import 'package:medlegten/models/promotion/promotion.dart';
import 'package:medlegten/utils/app_router.dart';

// ignore: must_be_immutable
class PromotionList extends HookWidget {
  PromotionList({Key? key, this.promoList}) : super(key: key);
  final List<Promotion>? promoList;
  final TextStyle textStyle = TextStyle(
      color: ColorTable.color48_53_159,
      fontSize: 14,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold);
  PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Урамшуулал', style: textStyle),
          // Container(
          //     margin: const EdgeInsets.only(right: 20),
          //     child: Text('Бүгдийг харах', style: textStyle))
        ]),
        Container(
          margin: const EdgeInsets.only(top: 10),
          height: MediaQuery.of(context).size.width * 0.4,
          child: PageView.builder(
            padEnds: false,
            controller: pageController,
            scrollDirection: Axis.horizontal,
            itemCount: promoList!.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  AutoRouter.of(context).push(PromotionDetailRoute(webUrl: promoList![index].webUrl));
                },
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.35,
                  margin: const EdgeInsets.only(left: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                          promoList![index].imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
