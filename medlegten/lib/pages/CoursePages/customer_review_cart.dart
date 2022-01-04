import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';

class CustomerReviewCart extends StatelessWidget {
  final String profileImg;
  final String fullName;
  final String position;
  final String description;
  final int star;

  const CustomerReviewCart({Key? key, required this.profileImg, required this.fullName, required this.position, required this.description, required this.star}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 140,
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
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20, left: 15, right: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(profileImg)
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: Text(fullName, style: TextStyle(color: colorBlack, fontWeight: FontWeight.w700, fontSize: 18, fontFamily: 'Roboto'),),
                              ),
                              addVerticalSpace(5),
                              SizedBox(
                                child: Text(position, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 18, fontFamily: 'Roboto'),),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                    child: Row(
                      children: [
                        for (var i = 1; i <= 5; i++ )
                          starPrint(star, i)
                      ],
                    )
                ),
              ],
            ),
            addVerticalSpace(10),
            Text(
                description,
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14, fontFamily: 'Roboto', height: 1.5)),
          ],
        ),
      ),
    );
  }
}

starPrint(star, num) {
  if(star >= num)
    {
      return Icon(
        Icons.star,
        color: Colors.orange,
        size: 20.0,
      );
    }
  else
    {
      return Icon(
        Icons.star_border,
        color: Colors.orange,
        size: 20.0,
      );
    }
}