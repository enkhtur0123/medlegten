import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';

class PreliminaryTest extends StatelessWidget {
  const PreliminaryTest({Key? key}) : super(key: key);

  final TextStyle textStyle = const TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorTable.color255_255_255,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              RichText(
                text: TextSpan(
                  text: 'Do you want to',
                  style: DefaultTextStyle.of(context).style,
                  children: const [
                    WidgetSpan(
                      child: Text(
                        'take preliminary test ?',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
