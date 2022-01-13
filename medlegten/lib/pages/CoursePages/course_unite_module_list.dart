import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medlegten/common/colors.dart';
import 'package:medlegten/common/widget_functions.dart';
import 'package:medlegten/components/landing_header.dart';
import 'package:medlegten/components/loading.dart';
import 'package:medlegten/components/wide_button.dart';
import 'package:medlegten/models/Landing/course_unit.dart';
import 'package:medlegten/models/Landing/course_unit_module_list.dart';
import 'package:medlegten/pages/CoursePages/Unit_grammarTable/module_grammarTable.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTable.color255_255_255,
      body: Padding(
        padding: EdgeInsets.all(0),
        // padding: EdgeInsets.only(top: 30, left: 40, right: 40, bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LandingHeader(100),
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, left: 40, right: 40, bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'UNIT ' +
                            unitInfo.unitNumber +
                            ': ' +
                            unitInfo.unitName.toUpperCase(),
                        style: TextStyle(
                            color: colorPrimary,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                      addVerticalSpace(8),
                      Row(
                        children: [
                          const SizedBox(
                              child: Icon(
                            Icons.person_outline_outlined,
                            color: Color.fromRGBO(130, 130, 130, 1),
                            size: 12.0,
                          )),
                          addHorizontalSpace(3),
                          Text('Beginner',
                              style: const TextStyle(
                                  color: Color.fromRGBO(130, 130, 130, 1),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12)),
                          addHorizontalSpace(20),
                          const SizedBox(
                              child: Icon(
                            Icons.timer,
                            color: Color.fromRGBO(130, 130, 130, 1),
                            size: 12.0,
                          )),
                          addHorizontalSpace(3),
                          Text('16 min',
                              style: const TextStyle(
                                  color: Color.fromRGBO(130, 130, 130, 1),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12)),
                        ],
                      )
                    ],
                  ),
                  CircularPercentIndicator(
                      radius: 40.0,
                      lineWidth: 3.0,
                      percent: 0.6,
                      center: Text(
                        "60%",
                        style: TextStyle(color: colorPrimary),
                      ),
                      progressColor: colorPrimary)
                ],
              ),
            ),
            addVerticalSpace(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Divider(
                color: Color.fromRGBO(199, 201, 217, .2),
                thickness: 1,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      FutureBuilder<List<CourseUnitModuleList>?>(
                          future: LandingRepository()
                              .getCourseUnitModuleList(unitInfo.unitId),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<CourseUnitModuleList>?>
                                  snapshot) {
                            if (snapshot.hasData) {
                              List<Tuple2<int, CourseUnitModuleList>>
                                  listTuple =
                                  <Tuple2<int, CourseUnitModuleList>>[];
                              for (int i = 0; i < snapshot.data!.length; i++) {
                                listTuple.add(Tuple2<int, CourseUnitModuleList>(
                                    i, snapshot.data![i]));
                              }
                              return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: listTuple
                                      .map((tuple) => buildTimeline(
                                          tuple.item2,
                                          tuple.item1 == 0
                                              ? 0
                                              : tuple.item1 ==
                                                      listTuple.length - 1
                                                  ? 1
                                                  : -1,
                                          context))
                                      .toList());
                            } else if (snapshot.hasError) {
                              return const Loading();
                            } else {
                              return const Loading();
                            }
                          }),
                    ],
                  ),
                ),
              ),
            ),
            addVerticalSpace(10),
            WideButton("Let's Start", colorSecondary, colorWhite, () {})
          ],
        ),
      ),
    );
  }
}

Widget buildTimeline(CourseUnitModuleList data, int idx, context) {
  return SizedBox(
    width: double.infinity,
    height: 70,
    child: TimelineTile(
      axis: TimelineAxis.vertical,
      hasIndicator: true,
      isFirst: idx == 0,
      isLast: idx == 1,
      indicatorStyle: IndicatorStyle(
        color: colorPrimary,
        width: 25,
        height: 25,
        padding: EdgeInsets.all(0),
      ),
      endChild: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: GestureDetector(
            onTap: () async {
              switch (data.moduleTypeId) {
                case "1":
                  {
                    var unitIntro =
                        await UnitRepository().getUnitIntroVideo(data.moduleId);

                    AutoRouter.of(context).push(
                        CourseUnitIntroVideoRoute(unitIntroVideo: unitIntro!));
                  }
                  break;

                case "2":
                  {
                    // Grammar table
                    AutoRouter.of(context).push(ModuleGrammarTableRoute());
                  }
                  break;

                case "3":
                  {
                    // Mixed video
                    AutoRouter.of(context).push(ModuleMixedVideoRoute());
                  }
                  break;

                case "4":
                  {
                    // Reading
                    AutoRouter.of(context).push(ModuleReadingRoute());
                  }
                  break;

                case "5":
                  {
                    // Listening
                    AutoRouter.of(context).push(ModuleListenRoute());
                  }
                  break;

                case "6":
                  {
                    // Writing
                    AutoRouter.of(context).push(ModuleWritingRoute());
                  }
                  break;

                case "7":
                  {
                    // Conversation video
                    AutoRouter.of(context).push(ModuleConversationVideoRoute());
                  }
                  break;

                case "8":
                  {
                    // progress exam
                    AutoRouter.of(context).push(ModuleProgressExamRoute());
                  }
                  break;

                default:
                  {
                    print('no module');
                  }
              }
            },
            child: Container(
              child: Text(
                data.moduleTypeName,
                style: TextStyle(
                    color: colorPrimary,
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ),
            ),
          )),
    ),
  );
}
