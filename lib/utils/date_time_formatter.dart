import 'package:intl/intl.dart';

class MyDateTimeFormatter {
  MyDateTimeFormatter(
      {this.date = "", this.noTime = false, this.nowDateTime = false});
  String? date;
  bool noTime;
  bool? nowDateTime;

  DateTime toDateTime() {
    DateTime dateTime;
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    DateFormat noTimeDateFormat = DateFormat("yyyy-MM-dd");

    if (!noTime) {
      if (nowDateTime!) {
        dateTime = dateFormat.parse(DateTime.now().toString());
      } else {
        dateTime = dateFormat.parse(date!);
      }
    } else {
      DateTime now = DateTime.now();
      String formattedDate = "";
      if (nowDateTime!) {
        dateTime = noTimeDateFormat
            .parse(dateFormat.parse(DateTime.now().toString()).toString());
        formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
      } else {
        dateTime = noTimeDateFormat.parse(dateFormat.parse(date!).toString());
        formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
      }
      dateTime = DateTime(dateTime.year,dateTime.month,dateTime.day);
    }

    return dateTime;
  }
}
