class TimeConvertHelper {
  String timeConvert({int time = 0}) {
    Duration duration = Duration(seconds: time);

    return [duration.inHours, duration.inMinutes, duration.inSeconds]
        .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
        .join(':');
    // String? timeString;
    // int? second, minut, hour;
    // if (time < 60) {
    //   timeString = "${time.toString()} сек";
    // } else if (time < 3600) {
    //   minut = time ~/ 60;
    //   timeString = "${minut.toString()} мин";
    //   if (time % 60 != 0) {
    //     second = (time % 60).toInt();
    //     timeString = timeString + " ${second.toString()} сек";
    //   }
    // } else {
    //   hour = (time ~/ 3600).toInt();
    //   timeString = "${hour.toString()} цаг ";
    //   if (time % 3600 != 0) {
    //     minut = ((time % 3600) ~/ 60).toInt();
    //     timeString = timeString + " ${minut.toString()} мин";
    //   }
    //   if (((time % 3600) % 60) != 0) {
    //     second = ((time % 3600) % 60);
    //     timeString = timeString + " ${second.toString()} сек";
    //   }
    // }
    // return time;
  }
}
