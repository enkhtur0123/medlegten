import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/models/Landing/promotion_info.dart';
import 'package:medlegten/pages/LandingPages/promotion_cart.dart';

class PromotionList extends HookWidget {
  PromotionList({Key? key}) : super(key: key);

  final List<PromotionInfo> promoList = [];
  final TextStyle textStyle = TextStyle(color: ColorTable.color48_53_159);
  final CarouselOptions carouselOptions = CarouselOptions(
      autoPlay: false,
      enlargeCenterPage: false,
      height: 300,
      viewportFraction: 1.0,
      onPageChanged: (index, reason) {
        //currentCarouselIndex.value = index;
      });

  @override
  Widget build(BuildContext context) {
    var currentIndex = useState(0);

    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Promotions', style: textStyle),
          Container(),
          Text('See All', style: textStyle)
        ]),
        CarouselSlider.builder(
          itemCount: promoList.length,
          itemBuilder: (ctx, index, realIdx) {
            var inner = promoList[currentIndex.value];
            return PromotionCart(inner);
          },
          options: carouselOptions,
        )
      ],
    );
  }
}