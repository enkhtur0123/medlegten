import 'package:flutter/material.dart';
import 'package:medlegten/models/Landing/promotion_info.dart';

class PromotionCart extends StatelessWidget {
  const PromotionCart(this.promotionInfo, {Key? key}) : super(key: key);

  final PromotionInfo promotionInfo;

  final TextStyle textStyle = const TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(promotionInfo.backroundImgUrl),
            fit: BoxFit.cover),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Flexible(
                flex: 2,
                child: Column(
                  children: [
                    Text(promotionInfo.title, style: textStyle),
                    Text(promotionInfo.description, style: textStyle),
                  ],
                ),
              ),
              Flexible(
                child: Image(
                  image: NetworkImage(promotionInfo.imgUrl),
                  height: 200,
                  width: 200,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
