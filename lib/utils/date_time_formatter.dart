import 'package:intl/intl.dart';

class MyDateTimeFormatter {
  MyDateTimeFormatter({this.date = "", this.noTime = false, this.nowDateTime = false});
  String? date;
  bool noTime;
  bool? nowDateTime;

  DateTime toDateTime() {
    DateTime dateTime;
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    DateFormat noTimeDateFormat = DateFormat("yyyy-MM-dd");
    
    if (nowDateTime!) {
      dateTime = dateFormat.parse(DateTime.now().toString());
    } else {
      dateTime = dateFormat.parse(date!);
    }
    return dateTime;
  }
}
