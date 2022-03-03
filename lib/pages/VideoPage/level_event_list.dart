import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/models/video/level_event.dart';
import 'package:medlegten/pages/VideoPage/level_event_item.dart';
import 'package:medlegten/utils/app_router.dart';
import 'package:medlegten/widgets/TextButton.dart';

// ignore: must_be_immutable
class LevelEventPage extends HookWidget {
  LevelEventPage({Key? key, this.levelEvents}) : super(key: key);
  List<LevelEvent>? levelEvents;

  PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.68);
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      children: levelEvents!.map((e) {
        return Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    e.levelName!,
                    style: const TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 15),
                    child: TextButtonWidget(
                      text: "Бүгд",
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      onTap: () {
                        AutoRouter.of(context).push(LevelVideoListRoute(
                            levelId: e.levelId,
                            categoryName: e.events[0].categoryName));
                      },
                    ),
                  ),
                ],
              ),
            ),
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
                itemCount: e.events.length,
                itemBuilder: (context, index) {
                  return LevelEventItem(event: e.events[index]);
                },
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
