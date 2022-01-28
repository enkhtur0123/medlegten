import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/components/loading.dart';
import 'package:medlegten/models/Landing/customer_review.dart';
import 'package:medlegten/pages/CoursePages/customer_review_cart.dart';
import 'package:medlegten/repositories/landing_repository.dart';
import 'package:medlegten/widgets/TextButton.dart';
/// Жагсаалт авах хэсэгт заавал listview ашиглах
// ignore: must_be_immutable
class CustomerReviewList extends HookWidget {
  CustomerReviewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isAll = useState(false);
    var _controller = useScrollController();
    return Column(
      children: [
        addVerticalSpace(30),
        Row(  
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButtonWidget(text: 'Reviews', onTap: () {
            }),
            TextButtonWidget(
                text: 'See All',
                onTap: () {
                  isAll.value = true;
                    _controller.jumpTo(_controller.position.maxScrollExtent);
                })
          ],
        ),
        addVerticalSpace(10),
        FutureBuilder<List<CustomerReview>?>(
          // ignore: unrelated_type_equality_checks
          future: LandingRepository().getCustomerReviewList(isAll.value ? 1 : 0),
          builder: (BuildContext context, AsyncSnapshot<List<CustomerReview>?> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                controller: _controller,
                physics: ClampingScrollPhysics(),
                addAutomaticKeepAlives: true,
                padding: EdgeInsets.all(0),
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return CustomerReviewCart(snapshot.data![index]);
                },
              );
            } else if (snapshot.hasError) {
              return const Loading();
            } else {
              return const Loading();
            }
          },
        ),
      ],
    );
  }
}
