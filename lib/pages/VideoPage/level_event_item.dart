import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medlegten/models/video/event.dart';

class LevelEventItem extends HookWidget {
  const LevelEventItem({Key? key, this.event,this.edgeInsets}) : super(key: key);

  final Event? event;
  final EdgeInsets? edgeInsets;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: edgeInsets?? const EdgeInsets.only(left: 15, top: 15, bottom: 20),
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
              child: getEventImageWidget(context: context, event: event),
            ),
            const SizedBox(height: 10),
            Flexible(flex: 3, child: getEventInfo(event: event))
          ],
        ),
      ),
    );
  }

  Widget getEventImageWidget({BuildContext? context, Event? event}) {
    return Stack(
      children: [
        SizedBox(
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            child: CachedNetworkImage(
              imageUrl: event!.imgUrl,
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
                    SvgPicture.asset(
                      "assets/svg/layers.svg",
                      width: 25,
                    ),
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
