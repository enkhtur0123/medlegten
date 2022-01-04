import 'package:flutter/material.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/pages/CoursePages/customer_review_cart.dart';

class CustomerReview extends StatelessWidget {
  const CustomerReview({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          addVerticalSpace(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Text('Review', style: TextStyle(color: colorPrimary, fontWeight: FontWeight.w500, fontSize: 14, fontFamily: 'Roboto'),)
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: Text('See All', style: TextStyle(color: colorPrimary, fontWeight: FontWeight.w500, fontSize: 14, fontFamily: 'Roboto'),)
              ),
            ],
          ),
          addVerticalSpace(10),
          CustomerReviewCart(
              profileImg: 'http://angular-material.fusetheme.com/assets/images/avatars/brian-hughes.jpg',
              fullName: 'Bold Bayarsaikhan',
              position: '12-р сургууль',
              description: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
              star: 4
          ),
        ],
      )
    );
  }
}
