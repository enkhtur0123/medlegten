import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/components/video_player_widget.dart';
import 'package:video_player/video_player.dart';
import 'package:expandable/expandable.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({Key? key}) : super(key: key);

  @override
  _CourseDetailState createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  late VideoPlayerController _controller;
  var videoUrl =
      'https://d3jhshah1dpupe.cloudfront.net/syt.mp4?Expires=1639769720&Signature=gYc8EpPjKXE4OylTLh73jsGOsMYvqfiMhDMrmBFoeeDFWT4sM99DDQvT7Ueff2i6RwkfRI4LS7OzAEqEQGgb1sFGaG4c~sqLRyHFJmhH-ibK~jawIdjjOSz1BWZPc6OlQOvDYD1wNcU6bKEqFpVKfGuju7DPkdcCCTe~NZnjAIwaEAludg9BO-SmLHAYTnj~5vWzBBEJXnhU67k512KiaKNt-buXocnh6UVbt3g1170c72SNf9FXe8Q4ysknQwoQ2rmm~7U2EC0QYw8sCx0tpJ57MoivESz1Pu2is45zz5ssx8H8tttI-aGqMiSCzvesqVDQ5lVdrsj454863i~Ehw__&Key-Pair-Id=APKAIYQFGV25I2V2NNIA';

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(videoUrl)
      ..addListener(() => setState(() {}))
      ..setLooping(false)
      ..initialize();
    // ..initialize().then((_) => _controller.play());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          addVerticalSpace(1),
          VideoPlayerWidget(controller: _controller),
          addVerticalSpace(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ExpandablePanel(
              header: const Text(
                'A1 Course - Анхан шатны хичээлийн агуулга',
                style: TextStyle(
                    color: colorPrimary,
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              collapsed: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        child: Icon(
                          Icons.remove_red_eye_outlined,
                          color: Color.fromRGBO(130, 130, 130, 1),
                        ),
                      ),
                      addHorizontalSpace(20),
                      const SizedBox(
                        child: Icon(
                          CupertinoIcons.heart,
                          color: Color.fromRGBO(130, 130, 130, 1),
                          size: 12,
                        ),
                      ),
                      addHorizontalSpace(3),
                      const Text('456 Likes',
                          style: TextStyle(
                              color: Color.fromRGBO(130, 130, 130, 1),
                              fontWeight: FontWeight.w400,
                              fontSize: 12)),
                      addHorizontalSpace(20),
                      const SizedBox(
                          child: Icon(
                        Icons.timer,
                        color: Color.fromRGBO(130, 130, 130, 1),
                        size: 12.0,
                      )),
                      addHorizontalSpace(3),
                      const Text('2 minutes',
                          style: TextStyle(
                              color: Color.fromRGBO(130, 130, 130, 1),
                              fontWeight: FontWeight.w400,
                              fontSize: 12)),
                    ],
                  )
                ],
              ),
              expanded: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                          child: Icon(
                        Icons.remove_red_eye_outlined,
                        color: Color.fromRGBO(130, 130, 130, 1),
                        size: 12.0,
                      )),
                      addHorizontalSpace(3),
                      const Text('1233 views',
                          style: TextStyle(
                              color: Color.fromRGBO(130, 130, 130, 1),
                              fontWeight: FontWeight.w400,
                              fontSize: 12)),
                      addHorizontalSpace(20),
                      const SizedBox(
                        child: Icon(
                          CupertinoIcons.heart,
                          color: Color.fromRGBO(130, 130, 130, 1),
                          size: 12,
                        ),
                      ),
                      addHorizontalSpace(3),
                      const Text('456 Likes',
                          style: TextStyle(
                              color: Color.fromRGBO(130, 130, 130, 1),
                              fontWeight: FontWeight.w400,
                              fontSize: 12)),
                      addHorizontalSpace(20),
                      const SizedBox(
                          child: Icon(
                        Icons.timer,
                        color: Color.fromRGBO(130, 130, 130, 1),
                        size: 12.0,
                      )),
                      addHorizontalSpace(3),
                      const Text('2 minutes',
                          style: TextStyle(
                              color: Color.fromRGBO(130, 130, 130, 1),
                              fontWeight: FontWeight.w400,
                              fontSize: 12)),
                    ],
                  ),
                  addVerticalSpace(20),
                  const Text(
                    'Та энэхүү курс хичээлийг бүрэн үзсэнээр Англи хэлний 26 цаг болон яриа, сонсгол гэх мэт олон ур чадваруудыг суралцана.',
                    style: TextStyle(color: colorBlack, height: 1.5),
                    softWrap: true,
                  )
                ],
              ),
            ),
          ),
          const Divider(
            height: 40,
            thickness: 1,
            endIndent: 0,
            color: Color.fromRGBO(199, 201, 217, .5),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Units',
              style: TextStyle(
                  color: colorPrimary,
                  fontFamily: 'Roboto',
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                //CourseDetailUnit(),
                //CourseDetailUnit(),
                //CourseDetailUnit(),
              ],
            ),
            // Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 10),
            //     child: Column(
            //     children: [
            //       FutureBuilder<List<CourseUnit>?>(
            //           future: LandingRepository().getCourseUnitList('1'),
            //           builder: (BuildContext context,
            //           AsyncSnapshot<List<CourseUnit>?> snapshot){
            //             if (snapshot.hasData) {
            //               return Column(
            //                 children: snapshot.data!
            //                     .map((unitInfo) => CourseDetailUnit(unitInfo))
            //                     .toList(),
            //                 );
            //             } else if (snapshot.hasError) {
            //               return const Loading();
            //             } else {
            //               return const Loading();
            //             }
            //           },
            //       ),
            //       // CourseDetailUnit(),
            //       // CourseDetailUnit(),
            //       // CourseDetailUnit(),
            //     ],
            //   ),
          ),
        ],
      ),
    );
  }
}
