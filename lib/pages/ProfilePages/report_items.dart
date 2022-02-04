

 import 'package:flutter/material.dart';

import 'report_item.dart';

List<ReportItem> items = [
  ReportItem(
      iconData: Icons.person_outline_outlined,
      imgUrl: "assets/img/profile/report_card_1.png",
      title: "LEVEL - Түвшин",
      body: "A1 Анхан шат",
      titleColor: const Color(0xff30359F).withOpacity(0.7),
      bodyColor: const Color(0xff30359F),
      iconColor: const Color(0xff30359F),
      bodyFontSize: 15,bodyFontWeight: FontWeight.normal),
  ReportItem(
      iconData: Icons.calendar_today_outlined,
      imgUrl: "assets/img/profile/report_card_2.png",
      title: "Хичээл үзсэн нийт цаг",
      body: "245",
      ),
  ReportItem(
      iconData: Icons.check_box_sharp,
      imgUrl: "assets/img/profile/report_card_3.png",
      title: "Мэддэг үгийн тоо",
      body: "1’260",
    ),
  ReportItem(
      iconData: Icons.favorite_border_sharp,
      imgUrl: "assets/img/profile/report_card_4.png",
      title: "Үзсэн бичлэгийн цаг",
      body: "40",
      ),
];
