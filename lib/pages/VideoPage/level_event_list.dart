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
    return ListView.builder(
      itemCount: levelEvents!.length,
      padding: const EdgeInsets.all(0),
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context,index){
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: 
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 0, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    levelEvents![index].levelName!,
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
                            levelId: levelEvents![index].levelId,
                            categoryName:  levelEvents![index].levelName!,
                            isCategorySearch: false));
                      },
                    ),
                  ),
                ],
              ),
            ),),
            Flexible(
              flex: 12,
              child: 
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
                itemCount: levelEvents![index].events.length,
                itemBuilder: (context, position) {
                  return LevelEventItem(event: levelEvents![index].events[position]);
                },
              ),
            ),)
          ],
        );
      },
    );
  }
}
