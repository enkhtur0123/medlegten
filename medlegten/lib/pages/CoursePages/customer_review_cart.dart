import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/models/Landing/customer_review.dart';

class CustomerReviewCart extends StatelessWidget {
  const CustomerReviewCart(this.customerReview, {Key? key}) : super(key: key);

  final CustomerReview customerReview;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorTable.color255_255_255,
      shadowColor: Colors.grey.withOpacity(0.5),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      // height: 140,

      child: Padding(
        padding:
            const EdgeInsets.only(top: 20, bottom: 20, left: 15, right: 15),
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
                          backgroundImage:
                              NetworkImage(customerReview.profileImg)),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: Text(
                                  customerReview.fullName,
                                  style: const TextStyle(
                                      color: colorBlack,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      fontFamily: 'Roboto'),
                                ),
                              ),
                              addVerticalSpace(5),
                              SizedBox(
                                child: Text(
                                  customerReview.position,
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                      fontFamily: 'Roboto'),
                                ),
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
                    for (var i = 1; i <= 5; i++)
                      starPrint(customerReview.star, i)
                  ],
                )),
              ],
            ),
            addVerticalSpace(10),
            Text(customerReview.description,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    height: 1.5)),
          ],
        ),
      ),
    );
  }
}

starPrint(star, _num) {
  if (star >= _num) {
    return const Icon(
      Icons.star,
      color: Colors.orange,
      size: 20.0,
    );
  } else {
    return const Icon(
      Icons.star_border,
      color: Colors.orange,
      size: 20.0,
    );
  }
}
