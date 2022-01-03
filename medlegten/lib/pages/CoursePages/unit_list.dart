import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/models/Landing/course_unit.dart';
import 'package:medlegten/pages/CoursePages/unit_cart.dart';

class UnitList extends HookWidget {
  UnitList({Key? key}) : super(key: key);

  final List<CourseUnit> unitList = [];
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
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text('Courses', style: textStyle),
        ]),
        CarouselSlider.builder(
          itemCount: unitList.length,
          itemBuilder: (ctx, index, realIdx) {
            var inner = unitList[currentIndex.value];
            return UnitCart(inner);
          },
          options: carouselOptions,
        )
      ],
    );
  }
}
