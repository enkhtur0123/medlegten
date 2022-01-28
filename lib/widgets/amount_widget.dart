import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medlegten/common/colors.dart';

// ignore: must_be_immutable
class AmountWidget extends StatelessWidget {
  
  AmountWidget({Key? key,this.amount}) : super(key: key);
  double? amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(toMoney(amount ?? 0),
           style: TextStyle(
             color: colorPrimary,
             fontWeight: FontWeight.w700,
             fontSize: 23, 
             fontFamily: 'Arial'
            )
          ),
        );
  }


  toMoney(amount) {
  final currencyFormatter = NumberFormat('#,##0', 'MNG');
  return currencyFormatter.format(amount) + '\u20AE';
  }
}
