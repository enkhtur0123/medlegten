import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/components/loading.dart';
import 'package:medlegten/models/Starting/onboarding.dart';
import 'package:medlegten/utils/global.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:medlegten/widgets/loader.dart';

class OnboardingPage extends HookWidget {
  final List<Onboarding> onboardingList;

  const OnboardingPage({
    required this.onboardingList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentCarouselIndex = useState(0);

    final double height = MediaQuery.of(context).size.height;

    return CarouselSlider.builder(
      itemCount: onboardingList.length,
      itemBuilder: (ctx, index, realIdx) {
        var inner = onboardingList[currentCarouselIndex.value];
        return createChildren(context, inner, currentCarouselIndex);
      },
      options: CarouselOptions(
          autoPlay: false,
          enlargeCenterPage: false,
          height: height,
          viewportFraction: 1.0,
          onPageChanged: (index, reason) {
            currentCarouselIndex.value = index;
          }),
    );
  }

  Widget createChildren(BuildContext context, Onboarding inner,
      ValueNotifier<int> currentCarouselIndex) {
    return Container(
      color: Colors.white,
      child: Stack(
        fit: StackFit.expand,
        alignment: AlignmentDirectional.center,
        children: [
          CachedNetworkImage(
            fit: BoxFit.fill,
            fadeInDuration: const Duration(milliseconds: 10),
            placeholder: (context, url) => const Loading(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            imageUrl: inner.mainImageUrl,
          ),
          Positioned(
            top: 65,
            right: 20,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Utils().hexToColor(inner.btnSkipBgColor),
                fixedSize: const Size(40, 24),
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
              onPressed: () {
                //currentCarouselIndex.value =
                //    nextBoarding(currentCarouselIndex.value);
                AutoRouter.of(context).pop();
              },
              child: Text(
                'Алгасах',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Utils().hexToColor(inner.btnSkipTxtColor),
                    fontFamily: 'Roboto-Regular',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 1),
              ),
            ),
          ),
          Positioned(
            bottom: 80,
            right: 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MaterialButton(
                  color: Utils().hexToColor(inner.btnCarouselBgColor),
                  shape: const CircleBorder(),
                  onPressed: () {
                    currentCarouselIndex.value =
                        nextBoarding(currentCarouselIndex.value);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Icon(Icons.chevron_right,
                        color: Utils().hexToColor(inner.btnCarouselArrowColor),
                        size: 40.0),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: onboardingList.map(
                    (entry) {
                      return circle(
                          Colors.black, inner.ordering == entry.ordering);
                    },
                  ).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget circle(Color circleColor, bool isCurrent) {
    return Container(
      height: 10,
      width: 10,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: circleColor.withOpacity(isCurrent ? 0.9 : 0.4),
      ),
    );
  }

  int nextBoarding(int currentCarouselIndex) {
    if (currentCarouselIndex == onboardingList.length - 1) {
      currentCarouselIndex = 0;
    } else {
      currentCarouselIndex++;
    }
    return currentCarouselIndex;
  }
}
