import 'package:flutter/material.dart';
import 'package:medlegten/themes/style.dart';

class LevelInfoWidget extends StatelessWidget {
  const LevelInfoWidget({Key? key,this.level}) : super(key: key);
  final String? level;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(left: 30, top: 15, bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff0D18F9).withOpacity(0.15),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/img/winner.png",
            width: 50,
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Таны англи хэлний түвшин".toUpperCase(),
                style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                    fontStyle: FontStyle.normal),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                level!,
                style: const TextStyle(
                    fontSize: 14,
                    color: secondaryColor,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
