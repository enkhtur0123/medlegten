import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/components/icon_text.dart';
import 'package:medlegten/components/loading.dart';
import 'package:medlegten/components/wide_button.dart';
import 'package:medlegten/models/Landing/course_unit.dart';
import 'package:medlegten/models/Landing/course_unit_module_list.dart';
import 'package:medlegten/repositories/landing_repository.dart';
import 'package:medlegten/repositories/unit_repository.dart';
import 'package:medlegten/utils/app_router.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:tuple/tuple.dart';
import 'package:auto_route/auto_route.dart';

class CourseUnitModuleListPage extends HookWidget {
  const CourseUnitModuleListPage(this.unitInfo, {Key? key}) : super(key: key);

  final CourseUnit unitInfo;
  final double timeLineHeight = 70;
  final double timeLineWidth = 300;
  final double indicatorHeight = 25;
  final double indicatorWidth = 25;

  Future<List<Tuple2<int, CourseUnitModuleList>>> fetchData() async {
    var result =
        await LandingRepository().getCourseUnitModuleList(unitInfo.unitId);

    List<Tuple2<int, CourseUnitModuleList>> listTuple = [];

    if (result != null) {
      for (int i = 0; i < result.length; i++) {
        listTuple.add(Tuple2<int, CourseUnitModuleList>(i, result[i]));
      }
    }
    return listTuple;
  }

  @override
  Widget build(BuildContext context) {
    final future = useMemoized(fetchData);
    final snapshot = useFuture(future);

    return Scaffold(
      appBar: AppBar(),
      backgroundColor: ColorTable.color255_255_255,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          addVerticalSpace(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'UNIT ${unitInfo.unitNumber}: ${unitInfo.unitName.toUpperCase()}',
                    style: const TextStyle(
                        color: colorPrimary,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                  addVerticalSpace(8),
                  Row(
                    children: [
                      const IconText(Icons.person_outline_outlined, 'Beginner'),
                      addHorizontalSpace(20),
                      const IconText(Icons.timer, '16 min'),
                    ],
                  )
                ],
              ),
              addHorizontalSpace(20),
              CircularPercentIndicator(
                  radius: 40.0,
                  lineWidth: 3.0,
                  percent: 0.6,
                  center: const Text(
                    "60%",
                    style: TextStyle(color: colorPrimary),
                  ),
                  progressColor: colorPrimary)
            ],
          ),
          addVerticalSpace(10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Divider(
              color: Color.fromRGBO(199, 201, 217, .2),
              thickness: 1,
            ),
          ),
          gradientButton(
            "Үгсийн сан - Unit ${unitInfo.unitNumber}",
            () {
              AutoRouter.of(context).push(VocabularyListRoute(unit: unitInfo));
            },
          ),
          Expanded(
            child: snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var tuple = snapshot.data![index];
                      return buildTimeline(
                          tuple.item2,
                          tuple.item1,
                          tuple.item1 == 0
                              ? 0
                              : tuple.item1 == snapshot.data!.length - 1
                                  ? 1
                                  : -1,
                          context);
                    },
                  )
                : const Loading(),
          ),
          WideButton(
            "Let's Start",
            colorSecondary,
            colorWhite,
            () {},
          ),
          addVerticalSpace(20),
        ],
      ),
    );
  }

  Widget gradientButton(String caption, Function() whenTap) {
    return SizedBox(
      height: 52,
      width: double.infinity, // <-- match_parent
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(68, 129, 235, 1),
                Color.fromRGBO(68, 129, 235, 0.8),
                Color.fromRGBO(68, 129, 235, 1),
              ],
              stops: [0.0, .5, 1.0],
            ),
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              onSurface: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            onPressed: whenTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.bookmark,
                  color: Color(0xffffffff),
                  size: 20,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  caption,
                  style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffffffff)),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTimeline(
      CourseUnitModuleList data, int idx, int isLast, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: SizedBox(
        width: double.infinity,
        height: 70,
        child: TimelineTile(
          axis: TimelineAxis.vertical,
          hasIndicator: true,
          isFirst: isLast == 0,
          isLast: isLast == 1,
          indicatorStyle: IndicatorStyle(
            indicator: Container(
              decoration: const BoxDecoration(
                border: Border.fromBorderSide(
                  BorderSide(
                    color: colorPrimary,
                  ),
                ),
                color: colorPrimary,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '${idx + 1}',
                  style: TextStyle(
                      color: ColorTable.color255_255_255,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            color: colorPrimary,
            width: 25,
            height: 25,
          ),
          endChild: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: GestureDetector(
              onTap: () {
                switch (data.moduleTypeId) {
                  case "1":
                    {
                      UnitRepository().getUnitIntroVideo(data.moduleId).then(
                          (value) => AutoRouter.of(context).push(
                              CourseUnitIntroVideoRoute(
                                  unitIntroVideo: value!, url: value.url)));
                    }
                    break;
                  case "2":
                    {
                      UnitRepository().getUnitGrammar(data.moduleId).then(
                          (value) => AutoRouter.of(context)
                              .push(GrammarTableRoute(unitGrammar: value!)));
                    }
                    break;

                  case "3":
                    {
                      UnitRepository().getMixedVideo(data.moduleId).then(
                          (value) => AutoRouter.of(context).push(
                              MixedVideoRoute(
                                  unitMixedVideo: value!, url: value.url)));
                    }
                    break;

                  case "4":
                    {
                      UnitRepository().getReading(data.moduleId).then((value) =>
                          AutoRouter.of(context)
                              .push(ReadingRoute(reading: value!)));
                    }
                    break;

                  case "5":
                    {
                      UnitRepository()
                          .getUnitListening(
                              moduleId: data.moduleId,
                              moduleTypeid: data.moduleTypeId)
                          .then((value) {
                        AutoRouter.of(context).push(ModuleListenRoute(
                            unitInfo: unitInfo, listeningQuiz: value));
                      });
                    }
                    break;
                  case "6":
                    {
                      // Writing
                      AutoRouter.of(context).push(const ModuleWritingRoute());
                    }
                    break;

                  case "7":
                    {
                      // Conversation video
                      UnitRepository().getConversationVideo('1001').then(
                          (value) => AutoRouter.of(context).push(
                              ConversationVideoRoute(
                                  unitIntroVideo: value!, url: value.url)));
                    }
                    break;

                  default:
                    {
                      print('no module');
                    }
                }
              },
              child: Text(
                data.moduleTypeName,
                style: const TextStyle(
                    color: colorPrimary,
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
