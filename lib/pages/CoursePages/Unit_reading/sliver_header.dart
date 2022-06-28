import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/components/loading.dart';
import 'dart:math';
import 'package:measure_size/measure_size.dart';
import 'package:medlegten/utils/global.dart';

class MyDynamicHeader extends SliverPersistentHeaderDelegate {
  MyDynamicHeader(this.imgUrl, this.titleText);

  int index = 0;
  String imgUrl;
  String titleText;
  double measureSize = 0;
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
            dividerWidget(shrinkPercentage),
          ],
        ),
      );
    });
  }

  Widget dividerWidget(double shrinkPercentage) {
    return Opacity(
      opacity: shrinkPercentage,
      child: Container(
        padding: EdgeInsets.only(top: minExtent - 2),
        height: minExtent,
        width: double.infinity,
        child: Divider(
          color: const Color.fromRGBO(199, 201, 217, 0.4),
          endIndent: 400 * (1 - shrinkPercentage),
          indent: 400 * (1 - shrinkPercentage),
          thickness: 1,
        ),
      ),
    );
  }

  Widget titleWidget(double shrinkPercentage) {
    var fontSize = max(14.0, 18.0 * (1 - shrinkPercentage));
    return Container(
      height: minExtent,
      width: double.infinity,
      padding: EdgeInsets.only(
        top: 5,
        left: -1 * min(0, -110 * shrinkPercentage),
      ),
      child: Center(
        child: MeasureSize(
          onChange: (Size newSize) {
            measureSize = newSize.width;
          },
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
                  -140 * shrinkPercentage,
                ),
            min(minExtent, minExtent * (1 - shrinkPercentage) + 60),
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
