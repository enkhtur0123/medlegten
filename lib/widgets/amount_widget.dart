import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medlegten/common/colors.dart';

// ignore: must_be_immutable
class AmountWidget extends StatelessWidget {
  AmountWidget(
      {Key? key,
      this.amount,
      this.fontWeight,
      this.fontSize,
      this.color,
      this.fontStyle})
      : super(key: key);
  double? amount;
  FontWeight? fontWeight;
  FontStyle? fontStyle;
  double? fontSize;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        toMoney(amount ?? 0),
        style: TextStyle(
            color: color ?? colorPrimary,
            fontStyle: fontStyle ?? FontStyle.normal,
            fontWeight: fontWeight ?? FontWeight.w700,
            fontSize: fontSize ?? 23,
            fontFamily: 'Arial'),
      ),
    );
  }

  toMoney(amount) {
    final currencyFormatter = NumberFormat('#,##0', 'MNG');
    return currencyFormatter.format(amount) + '\u20AE';
  }
}
