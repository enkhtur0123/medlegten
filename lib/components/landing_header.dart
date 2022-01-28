import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';

class LandingHeader extends StatelessWidget {
  final double height;
  // ignore: prefer_const_constructors_in_immutables
  LandingHeader(this.height, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        decoration: BoxDecoration(
          color: ColorTable.color120_100_254,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Image.asset('assets/img/LogoWhite.png',
                    width: 60, height: 20, fit: BoxFit.fitHeight),
                Text(
                  'MEDLEGTEN',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorTable.color255_255_255,
                    fontFamily: 'Poppins-SemiBold',
                    fontSize: 18,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.w600,
                    height: 1,
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                  iconSize: 30,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_rounded),
                  iconSize: 30,
                )
              ],
            ),
            Row(children: [
              const SizedBox(
                width: 10,
              ),
              Text(
                'Hi Bat',
                style: TextStyle(
                  color: ColorTable.color255_255_255,
                  fontFamily: 'Poppins-SemiBold',
                  fontSize: 12,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.w600,
                  height: 1,
                ),
              )
            ]),
          ],
        ));
  }
}
