import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlegten/common/colors.dart';

class MileStonePage extends StatelessWidget {
  const MileStonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          mileStoneItemWidget(context),
        ],
      ),
    );
  }

  Widget mileStoneItemWidget(BuildContext? context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              "assets/img/video/memorize.svg",
              width: 35,
              height: 35,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "Шинэ үг",
              style: Theme.of(context!).textTheme.subtitle1!.copyWith(
                  color: colorPrimary,
                  fontWeight: FontWeight.w800,
                  fontSize: 18),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                fit: FlexFit.tight,
                flex: 3,
                child: labelItemWidget(context: context)),
            Flexible(
              fit: FlexFit.tight,
              flex: 3,
              child: labelItemWidget(context: context),
            ),
          ],
        )
      ],
    );
  }

  Widget labelItemWidget({BuildContext? context}) {
    return Container(
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20),
            height: 70,
            width: 5,
            decoration: const BoxDecoration(
                color: Color(0xff1AE5EF),
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Одоо",
                style: Theme.of(context!)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: colorPrimary),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "2’700",
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Color(0xff1D2129), fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}
