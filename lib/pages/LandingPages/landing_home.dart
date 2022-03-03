import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:medlegten/components/loading.dart';
import 'package:medlegten/models/Landing/last_seen.dart';
import 'package:medlegten/pages/LandingPages/last_seen_widget.dart';
import 'package:medlegten/pages/LandingPages/promotion_list.dart';
import 'package:medlegten/pages/LandingPages/recommend_video.dart';
import 'package:medlegten/repositories/landing_repository.dart';

class LandingHome extends ConsumerStatefulWidget {
  const LandingHome({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return LandingHomeState();
  }
}

class LandingHomeState extends ConsumerState<LandingHome> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: LandingRepository().getLastSeen(),
        builder: (BuildContext context, AsyncSnapshot<LastSeen> snapShot) {
          if (snapShot.hasData) {
            return Container(
              margin: const EdgeInsets.only(top: 10, left: 20),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  PromotionList(
                    promoList: snapShot.data!.promotions,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  LastSeenWidget(lastSeen: snapShot.data,),
                  RecommendVideos(events: snapShot.data!.recommends)
                  
                ],
              ),
            );
          } else {
            return const Loading();
          }
        });
  }

  
}
