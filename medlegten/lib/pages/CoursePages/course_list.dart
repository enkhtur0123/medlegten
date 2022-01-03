import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/models/Landing/course_info.dart';
import 'package:medlegten/pages/CoursePages/course_cart.dart';
import 'package:medlegten/repositories/landing_repository.dart';

class CourseList extends HookConsumerWidget {
  CourseList({Key? key}) : super(key: key);

  final TextStyle textStyle = TextStyle(color: ColorTable.color48_53_159);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      ref.read(landingNotifierProvider.notifier).getCourseList();
    }, []);

    final repState = ref.watch(landingNotifierProvider);
    var currentIndex = useState(0);

    List<CourseInfo> courseList = [];

    return Center(
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text('Courses', style: textStyle),
          ]),
          repState.when(
            data: (data) {
              courseList = data as List<CourseInfo>;
              return CarouselSlider.builder(
                itemCount: courseList.length,
                itemBuilder: (ctx, index, realIdx) {
                  if (courseList.length > currentIndex.value) {
                    var inner = courseList[currentIndex.value];
                    return CourseCart(inner);
                  } else {
                    return Container();
                  }
                },
                options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: false,
                    height: 300,
                    viewportFraction: 1.0,
                    onPageChanged: (index, reason) {
                      currentIndex.value = index;
                    }),
              );
            },
            loading: () => const CircularProgressIndicator(),
            error: (error) => Text(error!),
          ),
        ],
      ),
    );
  }
}
