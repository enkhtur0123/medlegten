import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/models/video/event.dart';
import 'package:medlegten/models/video/title_text.dart';

import 'package:medlegten/pages/VideoPage/level_event_item.dart';
import 'package:medlegten/repositories/video_repository.dart';

// ignore: must_be_immutable
class RecommendVideos extends HookWidget {
  RecommendVideos({Key? key, this.events}) : super(key: key);

  List<Event>? events;
  PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.75);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FutureBuilder(
              future: VideoRepository().getVideoTitle(),
              builder: (context, AsyncSnapshot<TitleText> snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Text(
                      snapshot.data!.startPageTitle,
                      style: const TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600),
                    ),
                  );
                } else {
                  return Container();
                }
              }),
          Container(
            alignment: Alignment.topLeft,
            width: double.infinity,
            color: Colors.white,
            height: MediaQuery.of(context).size.width * 0.58,
            child: PageView.builder(
              pageSnapping: true,
              padEnds: false,
              controller: pageController,
              scrollDirection: Axis.horizontal,
              itemCount: events!.length,
              itemBuilder: (context, index) {
                return LevelEventItem(event: events![index], isHome: true);
              },
            ),
          ),
        ],
      ),
    );
  }
}
