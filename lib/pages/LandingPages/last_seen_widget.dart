import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/models/Landing/last_seen.dart';
import 'package:medlegten/pages/LandingPages/last_seen_item_widget.dart';
import 'package:medlegten/pages/LandingPages/last_seen_unit_widget.dart';

// ignore: must_be_immutable
class LastSeenWidget extends HookWidget {
  LastSeenWidget({Key? key, this.lastSeen}) : super(key: key);

  LastSeen? lastSeen;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20, left: 10),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(2, 2), // changes position of shadow
            ),
          ],
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15))),
      child: ExpandablePanel(
        controller: ExpandableController(initialExpanded: true),
        theme: const ExpandableThemeData(
            tapBodyToCollapse: true,
            tapBodyToExpand: true,
            useInkWell: true,
            iconSize: 35,
            iconColor: colorPrimary,
            iconPadding: EdgeInsets.only(right: 10),
            tapHeaderToExpand: true),
        header: SizedBox(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              "Сүүлд үзсэн",
              style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        collapsed: Container(),
        expanded: Column(
          children: [
            shadowContainer(),
            // ignore: unnecessary_null_comparison
            Container(
              margin: const EdgeInsets.only(
                  left: 15, bottom: 8, top: 10, right: 20),
              child: LastSeenUnitWidget(lastSeenUnit: lastSeen!.lastSeenUnit),
            ),
            LastSeenItemWidget(
                title: "Сүүлд уншсан",
                imgUrl: lastSeen?.lastSeenArticle?.slideImageUrl ?? "",
                text: lastSeen?.lastSeenArticle?.articleTitle ?? "",
                lastSeen: lastSeen,
                isArticle: true,
                data: lastSeen!.lastSeenArticle),
            LastSeenItemWidget(
                title: "Сүүлд үзсэн",
                imgUrl: lastSeen?.lastSeenPPV?.imgUrl ?? "",
                text: lastSeen?.lastSeenPPV?.contentName ?? "",
                lastSeen: lastSeen,
                isArticle: false,
                data: lastSeen!.lastSeenPPV,
                isLast: true),
          ],
        ),
      ),
    );
  }

  Widget shadowContainer() {
    return Container(
      width: double.infinity,
      height: 15,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xff0D18F9).withOpacity(0.15),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
      ),
    );
  }
}

Widget emptyContainer() {
  return Center(
    child: Container(
      margin: const EdgeInsets.all(15),
      alignment: Alignment.center,
      child: const Text(
        "Мэдээлэл байхгүй байна",
        style: TextStyle(color: Colors.grey),
      ),
    ),
  );
}
