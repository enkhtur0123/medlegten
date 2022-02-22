import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medlegten/models/video/event.dart';
import 'package:medlegten/models/video/movie.dart';
import 'package:medlegten/models/video/payment_info.dart';
import 'package:medlegten/repositories/video_repository.dart';
import 'package:medlegten/utils/app_router.dart';
import 'package:medlegten/utils/time_convert_helper.dart';

class LevelEventItem extends HookWidget {
  const LevelEventItem({Key? key, this.event, this.edgeInsets})
      : super(key: key);

  final Event? event;
  final EdgeInsets? edgeInsets;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        var data =
            await VideoRepository().getContentDetail(contentId: event!.eventId);
        List<Movie> movies = data[0];
        PaymentInfo paymentInfo = data[1];
        if (paymentInfo.isPurchased!) {
          AutoRouter.of(context).push(VideoDetailRoute(
              movies: movies,
              url: movies[0].hostUrl,
              title: movies[0].contentName,
              isSerial: event!.isSerial == "1" ? true : false));
        } else {
          AutoRouter.of(context).push(PaymentRoute(
              courseInfo: null,
              paymentType: "1004",
              contendId: paymentInfo.productId,
              isCourse: false,
              paymentInfo: paymentInfo));
        }
      },
      child: Container(
        margin:
            edgeInsets ?? const EdgeInsets.only(left: 15, top: 15, bottom: 20),
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
              Flexible(flex: 3, child: getEventInfo(event: event!))
            ],
          ),
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

Widget getEventInfo({required Event event}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.max,
    children: [
      Flexible(
        flex: 4,
        child: Text(
          event.eventName,
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
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 7,
              child: InfoItemWidget(
                  iconData: Icons.access_time_sharp,
                  text: TimeConvertHelper().timeConvert(
                      time: int.parse(
                          event.runTime != "" ? event.runTime : "0"))),
            ),
            const SizedBox(width: 15),
            Flexible(
                fit: FlexFit.tight,
                flex: 3,
                child:
                    InfoItemWidget(isSvg: true, text: event.vocabularyCount)),
            const SizedBox(width: 3),
            Flexible(
              fit: FlexFit.tight,
              flex: 8,
              child: InfoItemWidget(
                  iconData: Icons.category_outlined, text: event.categoryName),
            ),
          ],
        ),
      ),
    ],
  );
}

// ignore: non_constant_identifier_names
Widget InfoItemWidget({IconData? iconData, String? text, bool? isSvg = false}) {
  return Row(
    children: [
      !isSvg!
          ? Icon(
              iconData!,
              color: const Color(0xff828282),
              size: 15,
            )
          : SvgPicture.asset("assets/svg/layers.svg"),
      const SizedBox(
        width: 5,
      ),
      Text(
        text!,
        maxLines: 2,
        style: const TextStyle(
            color: Color(0xff828282),
            fontSize: 10,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.normal),
      )
    ],
  );
}
