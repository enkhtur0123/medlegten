import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/components/loading.dart';
import 'dart:math';

import 'package:medlegten/utils/global.dart';

class MyDynamicHeader extends SliverPersistentHeaderDelegate {
  MyDynamicHeader(this.imgUrl, this.titleText);

  int index = 0;
  String imgUrl;
  String titleText;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double shrinkPercentage = min(1, shrinkOffset / (maxExtent - minExtent));
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        decoration: const BoxDecoration(color: Colors.white),
        height: constraints.maxHeight,
        child: Stack(
          fit: StackFit.loose,
          children: [
            titleWidget(shrinkPercentage),
            pictureWidget(shrinkPercentage, constraints),
          ],
        ),
      );
    });
  }

  Widget titleWidget(double shrinkPercentage) {
    var fontSize = max(14.0, 18.0 * (1 - shrinkPercentage));
    return Container(
      //color: Colors.amber,
      height: minExtent,
      width: double.infinity,
      padding: EdgeInsets.only(
        left: -1 *
            min(
              -20,
              -100 * shrinkPercentage,
            ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Text(
                titleText,
                style: TextStyle(
                  color: colorPrimary,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  fontSize: fontSize,
                ),
              ),
            ),
          ),
          Opacity(
            opacity: 1 - shrinkPercentage,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.bookmark_outline_sharp,
                color: Color.fromRGBO(48, 53, 159, 0.8),
                size: 28.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget pictureWidget(double shrinkPercentage, BoxConstraints constraints) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
        height: max(
          maxExtent,
          minExtent * (1 - shrinkPercentage),
        ),
      ),
      child: FittedBox(
        fit: BoxFit.fitHeight,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            -1 *
                min(
                  0,
                  -100 * shrinkPercentage,
                ),
            min(minExtent, minExtent * (1 - shrinkPercentage) + 20),
            0,
            -1 *
                min(
                  0,
                  -30 * shrinkPercentage,
                ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
              -1 *
                  min(
                    0,
                    -20 * shrinkPercentage,
                  ),
            ),
            child: CachedNetworkImage(
              imageUrl: imgUrl,
              height: maxExtent - minExtent,
              width: max(
                  minExtent * 6, constraints.maxWidth * (1 - shrinkPercentage)),
              fit: BoxFit.cover,
              placeholder: (context, url) => const Loading(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;

  @override
  double get maxExtent => 250;

  @override
  double get minExtent => 60.0;
}
