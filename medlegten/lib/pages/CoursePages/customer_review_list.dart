import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/models/Landing/customer_review.dart';
import 'package:medlegten/pages/CoursePages/customer_review_cart.dart';
import 'package:medlegten/repositories/landing_repository.dart';

class CustomerReviewList extends HookWidget {
  const CustomerReviewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(
        color: colorPrimary,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        fontFamily: 'Roboto');

    return Column(
      children: [
        addVerticalSpace(30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Reviews',
                style: textStyle,
              ),
            ),
            const Align(
              alignment: Alignment.topRight,
              child: Text(
                'See All',
                style: textStyle,
              ),
            ),
          ],
        ),
        addVerticalSpace(10),
        FutureBuilder<List<CustomerReview>?>(
          future: LandingRepository().getCustomerReviewList('0'),
          builder: (BuildContext context,
              AsyncSnapshot<List<CustomerReview>?> snapshot) {
            if (snapshot.hasData) {
              return CustomerReviewCart(snapshot.data!.first);
            } else if (snapshot.hasError) {
              return const CircularProgressIndicator();
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ],
    );
  }
}
