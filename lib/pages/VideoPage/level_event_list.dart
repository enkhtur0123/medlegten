import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlegten/models/video/event.dart';
import 'package:medlegten/models/video/level_event.dart';

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
                    child: const Text(
                    "Бүгдийг харах",
                    style: TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                  ))
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
                  return Container(
                    margin:
                        const EdgeInsets.only(left: 15, top: 15, bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 7,
                          spreadRadius: 3,
                          offset: const Offset(2.0, 2.0),
                        )
                      ],
                      color: Colors.white,
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            flex: 8,
                            child: getEventImageWidget(
                                context: context, event: e.events[index]),
                          ),
                          const SizedBox(height: 10),
                          Flexible(
                              flex: 3,
                              child: getEventInfo(event: e.events[index]))
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget getEventInfo({Event? event}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(
          flex: 4,
          child: Text(
            event!.eventName,
            style: const TextStyle(
                color: Color(0xff333333),
                fontSize: 14,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.normal),
            textAlign: TextAlign.start,
          ),
        ),
        const SizedBox(height: 10),
        Flexible(
          flex: 4,
          child: Row(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.access_time_sharp,
                    color: Color(0xff828282),
                    size: 15,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    "3m 8sec",
                    style: TextStyle(
                        color: Color(0xff828282),
                        fontSize: 10,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.normal),
                  )
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Row(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset("assets/svg/layers.svg",width: 25,),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        event.vocabularyCount,
                        style: const TextStyle(
                            color: Color(0xff828282),
                            fontSize: 10,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget getEventImageWidget({BuildContext? context, Event? event}) {
    return Stack(
      children: [
        SizedBox(
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            child: CachedNetworkImage(
              imageUrl:event!.imgUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: MediaQuery.of(context!).size.width * 0.3,
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: SvgPicture.asset("assets/svg/player.svg"),
          ),
        )
      ],
    );
  }
}
