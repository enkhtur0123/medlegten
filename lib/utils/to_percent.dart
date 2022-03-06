class Percent {
  static String toPercent({double? percent}) {
    return (percent! * 100).toInt().toString() + "%";
  }
}
